package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.domain.UserDTO;
import com.lec.spring.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping({"", "/"})
	public String login() {
		return "/loginForm";
	}
	
	@GetMapping("/register")
	public String register() {
		return "user/registrationForm";
	}
	
	@PostMapping("/registerOk")
	public String registerOk(UserDTO user) {
        String rawPassword = user.getPassword();
        String encPassword = passwordEncoder.encode(rawPassword);
        user.setPassword(encPassword);
        
        userService.insert(user);
		return "redirect:/login";
	}
}
