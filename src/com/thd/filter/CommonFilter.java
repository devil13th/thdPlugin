package com.thd.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CommonFilter implements Filter {
 
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain fc) throws IOException, ServletException {
		System.out.println("======================= commonFilter  start ===================================" );
		Enumeration keys =  req.getParameterNames();
		while(keys.hasMoreElements()){
			String key = keys.nextElement().toString();
			System.out.println(key + " : " + req.getParameter(key));
		}
		HttpServletRequest hsq = (HttpServletRequest)req;
		System.out.println("session id:" + hsq.getSession(true).getId());
		System.out.println("======================= commonFilter end ===================================" );
		
		fc.doFilter(req, res);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
