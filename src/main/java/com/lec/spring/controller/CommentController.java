package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.domain.CommentDTO;
import com.lec.spring.service.CommentService;



@Controller
@RequestMapping("/room")
public class CommentController{
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/roomForm")
	public String roomForm() {
		return "/room/roomForm";
	}
	
	@RequestMapping("/roomDetail")
	public String roomDetail(Model model) {
		model.addAttribute("list", commentService.list());
		return "/room/roomDetail";
	}
	
	@RequestMapping("/writeReviewOk")
	public String writeReviewOk(Model model, CommentDTO dto ) {
		model.addAttribute("list", commentService.write(dto));
		return "/room/roomDetail";
	}
}	






