package com.lec.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	UserDAO mapper;
	
	@Autowired
	public UserDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(UserDAO.class);
	}
	
	@Override
	public int insert(UserDTO user) {
		return mapper.insert(user);
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
