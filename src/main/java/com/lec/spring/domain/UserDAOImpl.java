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
	public int insert(UserDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public UserDTO selectByUsername(String username) {
		return mapper.selectByUsername(username);
	}

	@Override
	public int update(UserDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public List<UserDTO> selectByUsernameLike(String searchKey) {
		return mapper.selectByUsernameLike(searchKey);
	}

	@Override
	public int insertAuth(int mb_uid, String auth) {
		return mapper.insertAuth(mb_uid, auth);
	}

	@Override
	public List<AuthDTO> selectAuthsByUsername(String username) {
		return mapper.selectAuthsByUsername(username);
	}

	@Override
	public int deleteAuth(int uid, String auth) {
		return mapper.deleteAuth(uid, auth);
	}

	@Override
	public int deleteAllAuths(int uid) {
		return mapper.deleteAllAuths(uid);
	}

	@Override
	public int delete(UserDTO dto) {
		return mapper.delete(dto);
	}

	@Override
	public Count countByUsername(String username) {
		return mapper.countByUsername(username);
	}

	@Override
	public Count countByEmail(String email) {
		return mapper.countByEmail(email);
	}

	@Override
	public Count countByNickname(String nickname) {
		return mapper.countByNickname(nickname);
	}

}
