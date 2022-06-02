package com.lec.spring.domain;

import java.util.List;

public interface LocationDAO {
	
	public abstract int insert(LocationDTO dto);
	public abstract int update(LocationDTO dto);
	public abstract List<LocationDTO> select();
	public abstract List<LocationDTO> selectByUid(int uid);
	public abstract List<LocationDTO> selectTop3ViewCnt();
	public abstract int deleteByUid(int uid);
	public abstract int incViewCnt(int uid);
	public abstract int decViewCnt(int uid);

}
