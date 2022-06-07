package com.lec.spring.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.spring.config.PrincipalDetails;
import com.lec.spring.domain.UserDTO;
import com.lec.spring.service.ReservationService;
import com.lec.spring.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	ReservationService reservationService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping({"", "/"})
	public String login() {
		return "redirect:/login";
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		PrincipalDetails principal = (PrincipalDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDTO user = principal.getUser();	
		model.addAttribute("reservationList", reservationService.selectByMb_uid(user.getUid()));
		return "/user/mypage";
	}
	
	@PostMapping("/changePasswordOk")
	public String changePasswordOk(String currentPw, String newPw, Model model, RedirectAttributes redirectAttr) {
		PrincipalDetails principal = (PrincipalDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDTO user = principal.getUser();	
		String page = "/user/changePasswordOk";
		
		if(!passwordEncoder.matches(currentPw, user.getPassword())) {
			redirectAttr.addFlashAttribute("pwChangeFailed", "pwChangeFailed");
			redirectAttr.addFlashAttribute("pwIncorrect", "현재 비밀번호를 틀리셨습니다");
			page = "redirect:/user/mypage";
		}
		
		
		String pwRegex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$";
		Pattern pattern = Pattern.compile(pwRegex);
		Matcher matcher = pattern.matcher(newPw);
		
		if(!matcher.matches()) {
			redirectAttr.addFlashAttribute("pwChangeFailed", "pwChangeFailed");
			redirectAttr.addFlashAttribute("pwWrongPattern", "비밀번호는 8자이상 20이하의 알파벳, 숫자, 특수믄자로 이루어져 있어야 합니다.");
			page = "redirect:/user/mypage";
		}
		
		if(page.equals("/user/changePasswordOk")) {
			String encPassword = passwordEncoder.encode(newPw);
			user.setPassword(encPassword);
			int result = userService.updatePassword(user);
			if(result == 1) {
				Authentication authentication = new UsernamePasswordAuthenticationToken(principal, encPassword, principal.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(authentication);
			}
			model.addAttribute("result", result);
		}
		
		return page;
	}
	
	@PostMapping("/changeContactOk")
	public String changeContactOk(String email, String mobile, Model model, RedirectAttributes redirectAttr) {
		PrincipalDetails principal = (PrincipalDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserDTO user = principal.getUser();
		String page = "/user/changeContactOk";
		
		Integer result = userService.selectUidByEmail(email);
		System.out.println(result);
		if(result != null && !result.equals(user.getUid())) {
			redirectAttr.addFlashAttribute("contactChangeFailed", "contactChangeFailed");
			redirectAttr.addFlashAttribute("inputEmail", email);
			redirectAttr.addFlashAttribute("inputMobile", mobile);
			redirectAttr.addFlashAttribute("errEmail", "중복된 이메일이 존재합니다.");
			page = "redirect:/user/mypage";
		}
		
		String pwRegex = "[0-9]{3}-[0-9]{4}-[0-9]{4}";
		Pattern pattern = Pattern.compile(pwRegex);
		Matcher matcher = pattern.matcher(mobile);
		if(!matcher.matches()) {
			redirectAttr.addFlashAttribute("contactChangeFailed", "contactChangeFailed");
			redirectAttr.addFlashAttribute("inputEmail", email);
			redirectAttr.addFlashAttribute("inputMobile", mobile);			
			redirectAttr.addFlashAttribute("errMobile", "휴대전화 번호 형식이 맞지 않습니다.");
			page = "redirect:/user/mypage";
		}
		
		if(page.equals("/user/changeContactOk")) {
			result = userService.update(user);
			if(result == 1) {
				principal.setEmail(email);
				principal.setMobile(mobile);
				Authentication authentication = new UsernamePasswordAuthenticationToken(principal, principal.getPassword(), principal.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(authentication);
			}
			model.addAttribute("result", result);
		}
		return page;
	}
	
	@RequestMapping("/cancelReservation")
	public String cancelReservation(int uid, Model model) {
		System.out.println("cancelling reservation uid " + uid);
		model.addAttribute("result", reservationService.delete(uid));
		return "/reservation/cancelOk";
	}
}
