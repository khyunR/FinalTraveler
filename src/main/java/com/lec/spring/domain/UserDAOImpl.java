package com.lec.spring.domain;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public int insert(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO selectByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserDTO> selectByUsernameLike(String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAuth(int mb_uid, String auth) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> selectAuthsByUid(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAuth(int uid, String auth) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAllAuths(int uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
