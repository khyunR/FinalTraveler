package com.lec.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WriteDAOImpl implements WriteDAO {

	private WriteDAO mapper;
	
	@Autowired
	public WriteDAOImpl(SqlSession sqlSession) {
		System.out.println("WriteDAOImpl() 생성");
		mapper = sqlSession.getMapper(WriteDAO.class);   
	}
	
	
	@Override
	public int insert(WriteDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public List<WriteDTO> select() {
		return mapper.select();
	}

	@Override
	public List<WriteDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int update(WriteDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int uid) {
		return mapper.deleteByUid(uid);
	}

	@Override
	public int incViewCnt(int uid) {
		return mapper.incViewCnt(uid);
	}
	
	@Override
	public int decViewCnt(int uid) {
		return mapper.incViewCnt(uid);
	}

}
