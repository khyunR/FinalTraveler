package com.lec.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.CommentDAO;
import com.lec.spring.domain.CommentDTO;


@Service
public class CommentService {

	CommentDAO dao;
	
	@Autowired
	public void setDao(CommentDAO dao) {
		this.dao = dao;
	}
	
	public CommentService() {
		System.out.println("CommentServcie() 생성");		
	}

	public List<CommentDTO> list() {
		
		return dao.select();
	}

	public int write(CommentDTO dto) {
		return dao.insert(dto);
	}

	public List<CommentDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);
	}

	public int update(CommentDTO dto) {
		return dao.update(dto);
	}

	public int deleteByUid(int uid) {
		return dao.deleteByUid(uid);
	}
}








