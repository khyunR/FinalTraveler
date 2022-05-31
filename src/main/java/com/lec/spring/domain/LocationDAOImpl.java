package com.lec.spring.domain;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class LocationDAOImpl implements LocationDAO {
	
	

	@Override
	public int insert(LocationDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(LocationDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<LocationDTO> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LocationDTO> selectByUid() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int uid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
