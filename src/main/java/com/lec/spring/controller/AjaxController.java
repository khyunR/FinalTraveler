package com.lec.spring.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lec.spring.domain.Count;
import com.lec.spring.domain.UserDAO;
import com.lec.spring.service.UserService;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	UserService userService;
	
	private UserDAO mapper;
	
	public AjaxController(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(UserDAO.class);
	}
	
	@RequestMapping("/checkUsernameDup")
	public Count checkUsernameDup(String username) {
		System.out.println("checkUsernameDup("+username+") 호출");
		return mapper.countByUsername(username);
	}
}
