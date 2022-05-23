package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.lec.spring.service.CommentService;



@Controller
@RequestMapping("/comment")

public class CommentController{
	
	
	private CommentService commentService;
	
	@Autowired
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	public CommentController() {
		System.out.println("CommentController() 생성");
	}
	
	

}	

//
//	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("CommentController.actionDo() 호출");
//		
//		String method = request.getMethod();
//				
//		// URL로부터 URI, ContextPath, Command 분리
//		String uri = request.getRequestURI();
//		String conPath = request.getContextPath() + "/comment";
//		String com = uri.substring(conPath.length());
//		
//		// 테스트 출력
//		System.out.println("uri: " + uri);  
//		System.out.println("conPath: " + conPath);  
//		System.out.println("com: " + com);
//
//		Command command = null;   // 어떠한 로직을 수행할지
//
//		switch(com) {
//		case "/list":
//			new CmtListCommand().execute(request, response);
//			break;
//		case "/write":
//			if(method.equals("POST")) {
//				new CmtWriteCommand().execute(request, response);
//			}
//			break;
//		case "/delete":
//			if(method.equals("POST")) {
//				new CmtDeleteCommand().execute(request, response);
//			}
//			break;
//		default:
//			response.sendRedirect(request.getContextPath()+"/home");
//		} // end switch
//	
//	
//	} // end doAction()
//	
//	
//
//} // end Controller







