package com.lec.spring.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.lec.spring.domain.UserDTO;
import com.lec.spring.service.UserService;

public class PrincipalDetails implements UserDetails{
	
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	private UserDTO user;
	public UserDTO getUser() {
		return user;
	}
	
	
	public PrincipalDetails(UserDTO user) {
		System.out.println("PrincipalDetails(user) 생성: " + user);
		this.user = user;
	}
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		System.out.println("getAuthorities() 호출");
		Collection<GrantedAuthority> collect = new ArrayList<>();
		
		List<String> list = userService.selectAuthsByUsername(user.getUsername());  // DB 에서 권한들 읽어옴.
		
		for(String auth : list) {
			collect.add(new GrantedAuthority() {
				
				@Override
				public String getAuthority() {					
					return auth;
				}
				
				@Override
				public String toString() {
					// TODO Auto-generated method stub
					return auth;
				}
			});
		}
	
		
		return collect;
	}


	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
