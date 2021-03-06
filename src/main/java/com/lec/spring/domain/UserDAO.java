package com.lec.spring.domain;

import java.time.LocalDateTime;
import java.util.List;

public interface UserDAO {
	// 회원 추가
	//  ┗ 회원가입
	abstract int insert(UserDTO dto);
	
	// 중복 확인 용
	//  ┗ 회원가입
	abstract Count countByUsername(String username);
	abstract Count countByEmail(String email);
	//  ┗ 이메일 주소 변경
	abstract Integer selectUidByEmail(String email);

	// 아이디로 특정 회원 조회
	//  ┗ 로그인
	abstract UserDTO selectByUsername(String username);
	
	// 이름과 이메일로 회원 조회
	//  ┗ 아이디 찾기
	abstract String selectUsernameByNameEmail(UserDTO dto);
	
	// 아이디와 이메일로 회원 조회
	//  ┗ 비밀번호 찾기
	abstract UserDTO selectByUsernameEmail(UserDTO dto);
	
	// 아이디와 이메일로 비밀번호 재설정
	//  ┗ 비밀번호 찾기
	abstract int updatePassword(UserDTO dto);
		
	// 회원 정보 수정
	//  ┗ 마이페이지 - 수정
	abstract int update(UserDTO dto);
	
	// 회원 가입일
	//  ┗ 관리자 페이지
	abstract List<UserDTO> selectRegDate();
	
	// 아이디로 회원 검색
	//  ┗ 관리자 페이지 - 권한부여
	abstract List<UserDTO> selectByUsernameLike(String searchKey);
	
	// 회원에게 권한 부여
	//  ┗ 관리자 페이지 - 권한부여
	abstract int insertAuth(int mb_uid, String auth);
	abstract int insertAuthByUsername(String username, String auth);
	
	// 회원 권한 조회
	//  ┗ 인가
	abstract List<AuthDTO> selectAuths();
	abstract List<AuthDTO> selectAuthsByUsername(String username);
	
	// 회원의 특정 권한 제거
	//  ┗ 관리자 페이지 - 권한제거
	abstract int deleteAuth(String username, String auth);
	
	// 회원 권한 모두 제거
	//  ┗ 관리자 페이지 - 권한제거
	abstract int deleteAllAuths(int uid);
	
	// 회원 삭제
	//  ┗ 회원탈퇴
	abstract int delete(UserDTO dto);

}
