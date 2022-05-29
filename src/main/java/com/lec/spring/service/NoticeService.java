package com.lec.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lec.spring.domain.WriteDAO;
import com.lec.spring.domain.WriteDTO;

//Service 단.
//JSP MVC model2 의 Command 역할 비슷
//  Controller -> Commmand -> DAO

//- Transaction 담당
//Spring
//@Controller -> @Service -> DAO -> JdbcTemplate
@Service
public class NoticeService {

	WriteDAO dao;
	
	@Autowired
	public void setDao(WriteDAO dao) {
		this.dao = dao;
	}
	
	public NoticeService() {
		System.out.println("NoticeServcie() 생성");		
	}

	public List<WriteDTO> list() {
		
		return dao.select();
	}

	public List<WriteDTO> viewByUid(int uid) {

		return dao.selectByUid(uid);
	}

	public int write(WriteDTO dto) {
		return dao.insert(dto);
	}

	public List<WriteDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);
	}

	public int update(WriteDTO dto) {
		return dao.update(dto);
	}

	public int deleteByUid(int uid) {
		return dao.deleteByUid(uid);
	}
}







