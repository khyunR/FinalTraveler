package com.lec.spring.domain;
import java.util.List;

// MyBatis가 매핑할 인터페이스
public interface WriteDAO {
	
	// 새글 작성 <-- DTO
	public abstract int insert(WriteDTO dto);
	
	// 전체 SELECT
	public abstract List<WriteDTO> select();
		
	// 특정 uid 의 글 하나 SELECT --> List<DTO> 로 리턴
	public abstract List<WriteDTO> selectByUid(int uid);
	
	// 특정 uid 의 글 수정 <- DTO
	public abstract int update(WriteDTO dto);
	
	// 특정 uid 글 삭제하기
	public abstract int deleteByUid(int uid);
	
	
} // end DAO

















