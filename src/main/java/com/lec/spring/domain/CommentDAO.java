package com.lec.spring.domain;
import java.util.List;

public interface CommentDAO{
	
	// 새글 작성 <-- DTO
	public abstract int insert(CommentDTO dto);
		
	// 전체 SELECT
	public abstract List<CommentDTO> select();
			

	// 댓글목록읽기
	// ResultSet --> List<DTO> 로 리턴
	public abstract List<CommentDTO> ResultSetByUid(int uid);
	
	// 특정글의 댓글들 SELECT
	public abstract List<CommentDTO> selectByUid(int uid);
	
	// 댓글 작성 <-- DTO
	public abstract int update(CommentDTO dto);
		
	// 특정 댓글 삭제하기 <-- uid
	public abstract int deleteByUid(CommentDTO dto);
	
	
	
} // end DAO















