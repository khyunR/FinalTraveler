package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.spring.service.CommentService;



@Controller
@RequestMapping("/room")
public class CommentController{
	@Autowired
	private CommentService commentService;
	
//	@Autowired
//	public void setCommentService(CommentService commentService) {
//		this.commentService = commentService;
//	}
	
	public CommentController() {
		System.out.println("CommentController() 생성");
	}
	
	@RequestMapping("/comment")
	public void list(Model model) {
		model.addAttribute("comment", commentService.list());
	}

	

}	






