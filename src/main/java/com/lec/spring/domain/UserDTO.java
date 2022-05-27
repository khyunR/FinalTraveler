package com.lec.spring.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class UserDTO {

	int uid;
	private String username;
	private String nickname;
	private String password;
	private String email;
	private String mobile;
	private String enabled;
	private LocalDateTime regDate;
	
	public UserDTO() {
		System.out.println("UserDTO() 생성");
	}
}
