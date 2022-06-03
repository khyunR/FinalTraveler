package com.lec.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocationDAOImpl implements LocationDAO {
	
	LocationDAO mapper;

	@Autowired
	public LocationDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(LocationDAO.class);
	}
	@Override
	public int insert(LocationDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int update(LocationDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public List<LocationDTO> select(int targetPageStartPostNo) {
		return mapper.select(targetPageStartPostNo);
	}

	@Override
	public List<LocationDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
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
		return mapper.decViewCnt(uid);
	}
	@Override
	public List<LocationDTO> selectTop3ViewCnt() {
		return mapper.selectTop3ViewCnt();
	}
	@Override
	public int countPosts() {
		// TODO Auto-generated method stub
		return mapper.countPosts();
	}

}
