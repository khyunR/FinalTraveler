package com.lec.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.UserDTO;
import com.lec.spring.service.UserService;

@Service
public class PrincipalDetailsService implements UserDetailsService {
	
	@Autowired
	private UserService userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername(" + username + ")");
		
		UserDTO user = userService.selectByUsername(username);  // DB 조회 
		
		// 해당 username 의 user 가 DB 에 있었다면
		// UserDetails 을 생성하여 리턴
		if(user != null) {
			PrincipalDetails details = new PrincipalDetails(user);
			details.setUserService(userService);
			return details;
		}
		
        // 해당 username 의 user 가 없다면!
        // UsernameNotFoundException을 throw 해주도록 한다
		throw new UsernameNotFoundException(username);
	}

}
