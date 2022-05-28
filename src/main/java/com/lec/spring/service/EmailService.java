package com.lec.spring.service;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.EmailDTO;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender emailSender;
	
	public boolean sendEmail(EmailDTO dto) {
		System.out.println("sendEmail() 호출");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(dto.getAddress());
		message.setSubject(dto.getSubject());
		message.setText(dto.getContent());
		try {
			emailSender.send(message);			
		}catch (MailException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	
	public String randomCodeGenerator() {
		return Integer.toString(ThreadLocalRandom.current().nextInt(100000, 1000000));
	}
	
	public boolean isCodeMatching(Cookie[] cookies, String inputCode) {
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				String value = cookie.getValue();
				if(name.equals("verificationCode")) {
					return (value.equals(inputCode));
				}
			}
		}
		return false;
	}
}
