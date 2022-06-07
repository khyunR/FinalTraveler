package com.lec.spring.domain;

import java.util.List;

public interface ReservationDAO {
	
	public abstract List<ReservationDTO> selectByMb_uid(int mb_uid);
	public abstract int insert (ReservationDTO dto);
	public abstract int delete (int uid);

}
