package com.lec.spring.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDTO {

	int uid;
	String username;
	String nickname;
	String password;
	String email;
	String mobile;
	
}
