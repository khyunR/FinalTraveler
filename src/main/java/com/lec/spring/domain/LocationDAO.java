package com.lec.spring.domain;

import java.util.List;

public interface LocationDAO {
	
	public abstract int insert(LocationDTO dto);
	public abstract int update(LocationDTO dto);
	public abstract List<LocationDTO> select();
	public abstract List<LocationDTO> selectByUid();
	public abstract int delete(int uid);

}
