package com.lec.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.ReservationDAO;
import com.lec.spring.domain.ReservationDTO;

@Service
public class ReservationService {
	@Autowired
	ReservationDAO dao;

	public List<ReservationDTO> selectByMb_uid(int mb_uid) {
		return dao.selectByMb_uid(mb_uid);
	}

	public int insert(ReservationDTO dto) {
		return dao.insert(dto);
	}

	public int delete(int uid) {
		return dao.delete(uid);
	}
}
