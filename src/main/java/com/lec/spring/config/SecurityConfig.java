package com.lec.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public PasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		
		http
			.authorizeRequests()
			.antMatchers("/user/**").authenticated()		
			.antMatchers("/member/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MEMBER')")
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/notice/write").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/notice/update").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/notice/deleteOk").access("hasRole('ROLE_ADMIN')")
			.anyRequest().permitAll()
			.and()
			
			.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/loginOk")
			.defaultSuccessUrl("/")
			.successHandler(new CustomLoginSuccessHandler("/"))
			.failureHandler(new CustomLoginFailureHandler())
			.and()
			
			.exceptionHandling()
			.accessDeniedHandler(new CustomAccessDeniedHandler())
			.and()
			
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login?logout")
			.invalidateHttpSession(false)
			.logoutSuccessHandler(new CustomLogoutSuccessHandler())

			;
	}
}
