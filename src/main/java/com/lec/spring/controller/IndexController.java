package com.lec.spring.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.spring.domain.UserDTO;
import com.lec.spring.service.UserService;


@Controller
public class IndexController {
	

	UserService userService;

	public IndexController() {}
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String login() {
		return "/loginForm";
	}
	
	@RequestMapping("/register")
	public String register(UserDTO dto, Model model) {
		System.out.println("register() 호출");
		return "registrationForm";
	}
	
	@PostMapping("/registerOk")
	public String registerOk(@ModelAttribute("w") @Valid UserDTO dto, String repassword,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		System.out.println("registerOk() 호출: " + dto.getUid() + ": " + dto.getUsername());
		System.out.println("repassword: " + repassword);
		System.out.println("result: " + result.toString());
		String page = "registerOk";
        
		if(result.hasErrors()) {
			System.out.println("result.hasError() == true");
			redirectAttrs.addFlashAttribute("w", dto);
			if(result.getFieldError("username") != null) {
				redirectAttrs.addFlashAttribute("errUsername", "아이디를 입력하세요.");
			}
			if(result.getFieldError("email") != null) {
				String emailErrCode = result.getFieldError("email").getCode();
				switch (emailErrCode) {
				case "emptyEmail":
					redirectAttrs.addFlashAttribute("errEmail", "이메일 주소를 입력하세요.");
					break;
				case "emailInvalidPattern":
					redirectAttrs.addFlashAttribute("errEmail", "이메일 주소를 다시한번 확인해주세요.");
					break;
				}
			}
			if(result.getFieldError("password") != null) {
				String pwErrCode = result.getFieldError("password").getCode();
				switch(pwErrCode) {
				case "passwordLengthUnder8":
				case "passwordLengthOver20":
					redirectAttrs.addFlashAttribute("errPassword", "비밀번호는 8자 이상 20자 이하로 입력하세요.");
					break;
				case "passwordInvalidPattern":
					redirectAttrs.addFlashAttribute("errPassword", "비밀번호는 문자, 숫자, 특수문자를 포함해야 합니다.");
					break;
				}
			}
			if(result.getFieldError("mobile")!=null) {
				String mobileErrCode = result.getFieldError("mobile").getCode();
				switch(mobileErrCode) {
				case "mobileLengthNotMatch":
					redirectAttrs.addFlashAttribute("errMobile", "휴대전화 번호 길이가 맞지 않습니다.");
					break;
				case "mobileInvalidPattern":
					redirectAttrs.addFlashAttribute("errMobile", "휴대전화 번호 형식이 맞지 않습니다.");
					break;
				}
			}
			page = "redirect:/register";
		}else {
			System.out.println("result.hasError() == false");
			int usernameDupChkDto = userService.countByUsername(dto.getUsername()).getCount();
			int nicknameDupChkDto = userService.countByNickname(dto.getNickname()).getCount();
			int emailDupChkDto = userService.countByEmail(dto.getEmail()).getCount();
			if(usernameDupChkDto != 0 || nicknameDupChkDto != 0 || emailDupChkDto != 0) {
				redirectAttrs.addFlashAttribute("w", dto);
				if(usernameDupChkDto != 0) {
					redirectAttrs.addFlashAttribute("errUsername", "중복되는 아이디가 존재합니다.");	
				}
				if(nicknameDupChkDto != 0) {				
					redirectAttrs.addFlashAttribute("errNickname", "중복되는 별명이 존재합니다.");	
				}
				if(emailDupChkDto != 0) {				
					redirectAttrs.addFlashAttribute("errEmail", "중복되는 이메일이 존재합니다.");	
				}
				page = "redirect:/register";
			}else {
				String rawPw = dto.getPassword();
				String encPw = passwordEncoder.encode(rawPw);
				dto.setPassword(encPw);
		        model.addAttribute("result", userService.insert(dto));
		        model.addAttribute("dto", dto);
			}	
		}
		return page;
	}
	
	@RequestMapping("/sample/guestpage")
	public String guestpage() {
		return "sample/guestAccessTest";
	}
}
