package com.lxm.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class SessionFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String[] notFilter = new String[] {"/login.jsp", "/user/login", 
				"/modify_password.jsp", "/make_certpic.jsp", 
				"/user/queryUserName", "/user/checkCertCode", 
				"/register.jsp", "/jumpto_login.jsp"};
		
		String uri = request.getRequestURI();
		boolean doFilter = true;
		for (String s : notFilter) {
			if (uri.indexOf(s) != -1) {
				logger.info("not need to filter");
				doFilter = false;
				break;
			}
		}
		
		if (doFilter) {
			Object obj = request.getSession().getAttribute("user");
			if (obj == null) {
				response.sendRedirect(request.getContextPath() + "/jumpto_login.jsp");
				return;
			} else {
				filterChain.doFilter(request, response);
			}
		} else {
			filterChain.doFilter(request, response);
		}
	}
	
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		if (header != null && "XMLHttpRequest".equals(header)) {			
			return true;
		}
		else {
			return false;
		}
	}
}
