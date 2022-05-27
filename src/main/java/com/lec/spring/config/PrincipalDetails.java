package com.lec.spring.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.lec.spring.domain.AuthDTO;
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
		
		List<AuthDTO> list = userService.selectAuthsByUsername(user.getUsername());  // DB 에서 권한들 읽어옴.
		System.out.println(list);
		
		
		for(AuthDTO auth : list) {
			
			System.out.println("auth: " + auth);
			
			
			collect.add(new GrantedAuthority() {
				
				@Override
				public String getAuthority() {			
					return auth.getAuth();
				}
				
				@Override
				public String toString() {
					// TODO Auto-generated method stub
					return auth.getAuth();
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
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		return user.getEnabled().equals("1") ? true : false ;
	}

}
