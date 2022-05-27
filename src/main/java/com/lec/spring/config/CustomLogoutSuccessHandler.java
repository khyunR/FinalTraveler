package com.lec.spring.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class CustomLogoutSuccessHandler implements LogoutSuccessHandler{

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		
		String redirectUrl = "/login?logoutHandler";
		
		// reg_url 이 parameter 에 있는 경우 logout 하고 해당 url 로 redirect
		if(request.getParameter("reg_url") != null) {
			redirectUrl = request.getParameter("reg_url");
		}		
		response.sendRedirect(redirectUrl);
		
	}

}
