package com.lec.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/room")
public class CommentController{
	
	@RequestMapping("/roomForm")
	public String roomForm() {
		return "/room/roomForm";
	}
	
	@RequestMapping("/roomDetail")
	public String roomDetail() {
		return "/room/roomDetail";
	}
}	






