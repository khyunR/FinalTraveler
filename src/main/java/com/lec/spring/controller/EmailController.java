package com.lec.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lec.spring.domain.EmailDTO;
import com.lec.spring.service.EmailService;

@RestController
@RequestMapping("/email")
public class EmailController {
	
	@Autowired
	EmailService emailService;
	
	public EmailController() {
		System.out.println("EmailController() 생성");
	};

	@PostMapping("/sendCode")
	public Map<String, String> sendCode(String emailAddr, HttpServletResponse response) {
		System.out.println("sendCode() 호출");
		Map<String, String> map = new HashMap<String, String>();
		EmailDTO email = EmailDTO.builder()
				.address(emailAddr)
				.subject("이메일 인증번호 입니다.")
				.build();
		String verificationCode = emailService.randomCodeGenerator();
		email.setContent(String.format("아래 인증번호를 확인하여 입력해주세요.\n 인증번호: %s", verificationCode));
		if(emailService.sendEmail(email)){
			map.put("status", "Ok");
			Cookie cookie = new Cookie("verificationCode", verificationCode);
			cookie.setMaxAge(3*60);
			response.addCookie(cookie);
		}else {
			map.put("status", "Failed");
		}
		
		return map;
	}
	
	@PostMapping("/checkCode")
	public Map<String, String> checkCode(String code, HttpServletRequest request){
		System.out.println("checkCode() 호출");
		Map<String, String> map = new HashMap<String, String>();
		if(emailService.isCodeMatching(request.getCookies(), code)) {
			map.put("status", "Ok");
			// TODO: 쿠키 삭제
		}else {
			map.put("status", "Failed");
		}
		return map;
	}
	
	
}
