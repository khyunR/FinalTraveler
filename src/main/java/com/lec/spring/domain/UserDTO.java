package com.lec.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class UserDTO {

	int uid;
	String username;
	String nickname;
	String password;
	String email;
	String mobile;
	
	public UserDTO() {
		System.out.println("UserDTO() 생성");
	}
}
