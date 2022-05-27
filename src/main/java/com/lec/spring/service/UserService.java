package com.lec.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.AuthDTO;
import com.lec.spring.domain.Count;
import com.lec.spring.domain.UserDAO;
import com.lec.spring.domain.UserDTO;

@Service
public class UserService {
	

	UserDAO dao;

	@Autowired
	public UserService(UserDAO dao) {
		this.dao = dao;
	}
	
	public int insert(UserDTO dto) {
		int cnt =  dao.insert(dto);
		if(cnt==1) {
			dao.insertAuth(dto.getUid(), "ROLE_MEMBER");			
		}
		return cnt;
	}
	
	public UserDTO selectByUsername(String username) {
		return dao.selectByUsername(username);
	}

	public int update(UserDTO dto) {
		return dao.update(dto);
	}
	
	public List<UserDTO> selectByUsernameLike(String searchKey){
		return dao.selectByUsernameLike(searchKey);
	}
	
	public int insertAuth(int mb_uid, String auth) {
		return dao.insertAuth(mb_uid, auth);
	}
	
	public List<AuthDTO> selectAuthsByUsername(String username) {
		return dao.selectAuthsByUsername(username);
	}

	public int deleteAuth(int uid, String auth) {
		return dao.deleteAuth(uid, auth);
	}

	public int deleteAllAuths(int uid) {
		return dao.deleteAllAuths(uid);
	}

	public int delete(UserDTO dto) {
		return dao.delete(dto);
	}
	
	public Count countByUsername(String username) {
		return dao.countByUsername(username);
	}


	public Count countByEmail(String email) {
		return dao.countByEmail(email);
	}
	
	public Count countByNickname(String nickname) {
		return dao.countByNickname(nickname);
	}

}
