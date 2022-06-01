package com.lec.spring.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuthDTO {
	int mb_uid;
	String username;
	String auth;
	
	@Override
	public String toString() {
		return "" + this.mb_uid + ": " + this.auth;
	}
}
