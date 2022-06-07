package com.lec.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	

	ReservationDAO mapper;

	@Autowired
	public ReservationDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(ReservationDAO.class);
	}
	
	@Override
	public List<ReservationDTO> selectByMb_uid(int mb_uid) {
		return mapper.selectByMb_uid(mb_uid);
	}

	@Override
	public int insert(ReservationDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int delete(int uid) {
		return mapper.delete(uid);
	}

}
