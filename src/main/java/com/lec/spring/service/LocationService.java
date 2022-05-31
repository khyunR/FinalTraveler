package com.lec.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.LocationDAO;
import com.lec.spring.domain.LocationDTO;
import com.lec.spring.domain.WriteDTO;

@Service
public class LocationService {

	@Autowired
	LocationDAO dao;
	

	public List<LocationDTO> list() {
		
		return dao.select();
	}

	public List<LocationDTO> viewByUid(int uid) {

		return dao.selectByUid(uid);
	}

	public int write(LocationDTO dto) {

		return dao.insert(dto);
	}

	public List<LocationDTO> selectByUid(int uid) {
		dao.incViewCnt(uid);
		return dao.selectByUid(uid);
	}

	public int update(LocationDTO dto) {
		return dao.update(dto);
	}

	public int deleteByUid(int uid) {
		return dao.deleteByUid(uid);
	}

}
