package com.lec.spring.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.spring.domain.EmailDTO;
import com.lec.spring.domain.UserDTO;
import com.lec.spring.domain.UserValidator;
import com.lec.spring.service.EmailService;
import com.lec.spring.service.UserService;


@Controller
public class IndexController {
	
	@Autowired
	UserService userService;
	@Autowired
	EmailService emailService;
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	public IndexController() {}

	@RequestMapping("/register")
	public String register(UserDTO dto, Model model) {
		System.out.println("register() 호출");
		return "registrationForm";
	}
	
	@PostMapping("/registerOk")
	public String registerOk(@ModelAttribute("w") @Valid UserDTO dto,
			BindingResult result, Model model, RedirectAttributes redirectAttrs) {
		
		System.out.println("registerOk() 호출: " + dto.getUid() + ": " + dto.getUsername());
		String page = "/registerOk";
        
		if(result.hasErrors()) {
			page = "redirect:/register";
			redirectAttrs.addFlashAttribute("w", dto);
			if(result.getFieldError("username") != null) {
				String idErrCode = result.getFieldError("username").getCode();
				switch (idErrCode) {
				case "emptyUsername":
					redirectAttrs.addFlashAttribute("errUsername", "아이디를 입력하세요.");					
					break;
				case "usernameLengthError":
					redirectAttrs.addFlashAttribute("errUsername", "아이디는 6자에서 20자 사이어야 햡니다.");					
					break;
				case "usernameInvalidPattern":
					redirectAttrs.addFlashAttribute("errUsername", "아이디는 영문으로 시작되어야 하며, 영문과 숫자로만 이루어져 있어야 합니다.");					
					break;
				default:
					break;
				}
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
				case "emptyPassword":
					redirectAttrs.addFlashAttribute("errPassword", "비밀번호를 입력하세요.");
					break;					
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
		}else {
			System.out.println("result.hasError() == false");
			int usernameDupChkDto = userService.countByUsername(dto.getUsername()).getCount();
			int emailDupChkDto = userService.countByEmail(dto.getEmail()).getCount();
			if(usernameDupChkDto != 0 || emailDupChkDto != 0) {
				page = "redirect:/register";
				redirectAttrs.addFlashAttribute("w", dto);
				if(usernameDupChkDto != 0) {
					redirectAttrs.addFlashAttribute("errUsername", "중복되는 아이디가 존재합니다.");	
				}
				if(emailDupChkDto != 0) {				
					redirectAttrs.addFlashAttribute("errEmail", "중복되는 이메일이 존재합니다.");	
				}
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
	
	@GetMapping("/login")
	public String login() {
		return "/loginForm";
	}
	
	@PostMapping("/login")
	public String loginFail() {
		System.out.println("POST: /login");
		return "/loginForm";
	}
	
	@RequestMapping("/auth")
	@ResponseBody
	public Authentication auth (HttpSession session) {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
	@RequestMapping("/findUsername")
	public String findUsername() {
		return "/findUsername";
	}
	
	@PostMapping("/findUsernameOk")
	public String findUsernameOk(UserDTO dto, Model model, RedirectAttributes redirectAttrs) {
		System.out.println("findUsernameOk() 호출");
		String page = "/findUsername";
		
		String result = userService.selectUsernameByNameEmail(dto);
		if(result==null || result.equals("")) {
			redirectAttrs.addFlashAttribute("w", dto);
			redirectAttrs.addFlashAttribute("errorMessage", "<br>정보가 일치하는 회원이 없습니다.<br>");
			page="redirect:/findUsername";
		}else {
	        model.addAttribute("foundUsername", result);
		}
		
		return page;
	}
	
	@RequestMapping("/findPassword")
	public String findPassword() {
		return "/findPassword";
	}
	
	@PostMapping("/findPasswordOk")
	public String findPasswordOk(UserDTO dto, Model model, RedirectAttributes redirectAttrs) {
		System.out.println("findPassword() 호출");
		String page = "/findPasswordOk";
		
		UserDTO result = userService.selectByUsernameEmail(dto);
		if(result==null) {
			redirectAttrs.addFlashAttribute("w", dto);
			redirectAttrs.addFlashAttribute("errorMessage", "<br>정보가 일치하는 회원이 없습니다.<br>");
			page="redirect:/findPassword";
		}else {
			String tempRandPw = userService.generateRandomPassword();
			result.setPassword(passwordEncoder.encode(tempRandPw));
			int cnt = userService.updatePassword(result);
			if(cnt==1) {
				model.addAttribute("result", cnt);
				EmailDTO email = EmailDTO.builder()
						.address(result.getEmail())
						.subject("임시 비밀번호가 설정되었습니다.")
						.content("임시 비밀번호가 아래와 같이 설정되었습니다.\n임시 비밀번호: "+tempRandPw+"\n로그인 후 비밀번호를 재설정 하시기 바랍니다.")
						.build();
				int emailSendCount = 0;
				while(!emailService.sendEmail(email)) {
					emailSendCount++;
					if(emailSendCount==3) {
						redirectAttrs.addFlashAttribute("w", dto);
						redirectAttrs.addFlashAttribute("errorMessage", "<br>임시 비밀번호 이메일 전송에 오류가 발생했습니다<br>");
						page="redirect:/findPassword";	
					}
				}
			}else {				
				redirectAttrs.addFlashAttribute("w", dto);
				redirectAttrs.addFlashAttribute("errorMessage", "<br>비밀번호 재설정에 오류가 발생했습니다<br>");
				page="redirect:/findPassword";				
			}
		}
		return page;
	}
	
	
    @RequestMapping("/accessError")
    public void accessError() {}
	
	@RequestMapping("/sample/guestpage")
	public String guestpage() {
		return "sample/guestAccessTest";
	}
	@RequestMapping("/main")
	public String main() {
		return "/index";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new UserValidator());
	}
	
}
