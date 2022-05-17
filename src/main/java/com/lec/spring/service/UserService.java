package com.lec.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.UserDAO;
import com.lec.spring.domain.UserDTO;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;

	public int insert(UserDTO user) {
		int cnt = dao.insert(user);
		
		return cnt;
	}

}
