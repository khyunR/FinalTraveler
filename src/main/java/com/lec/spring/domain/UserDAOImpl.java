package com.lec.spring.domain;

import java.time.LocalDateTime;
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
	public Integer selectUidByEmail(String email) {
		return mapper.selectUidByEmail(email);
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
	public int deleteAuth(String username, String auth) {
		return mapper.deleteAuth(username, auth);
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
	public String selectUsernameByNameEmail(UserDTO dto) {
		return mapper.selectUsernameByNameEmail(dto);
	}

	@Override
	public int updatePassword(UserDTO dto) {
		return mapper.updatePassword(dto);
	}

	@Override
	public UserDTO selectByUsernameEmail(UserDTO dto) {
		return mapper.selectByUsernameEmail(dto);
	}

	@Override
	public List<AuthDTO> selectAuths() {

		return mapper.selectAuths();
	}

	@Override
	public int insertAuthByUsername(String username, String auth) {
		return mapper.insertAuthByUsername(username, auth);
	}

	@Override
	public List<UserDTO> selectRegDate() {
		return mapper.selectRegDate();
	}

}
