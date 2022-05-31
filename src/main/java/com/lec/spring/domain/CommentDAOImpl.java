package com.lec.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO {


	private CommentDAO mapper;
	
	@Autowired
	public CommentDAOImpl(SqlSession sqlSession) {
		System.out.println("CommentDAOImpl() 생성");
		mapper = sqlSession.getMapper(CommentDAO.class);   
	}
	
	
	@Override
	public int insert(CommentDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public List<CommentDTO> select() {
		return mapper.select();
	}
	
	@Override
	public List<CommentDTO> ResultSetByUid(int uid) {
		return mapper.ResultSetByUid(uid);
	}

	@Override
	public List<CommentDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int update(CommentDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int uid) {
		return mapper.deleteByUid(uid);
	}

}
