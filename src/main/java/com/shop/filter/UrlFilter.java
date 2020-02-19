package com.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.pojo.User;

public class UrlFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		//获取访问的地址
		String url = req.getRequestURI();
		//获取session中的对象判断是否登录
		//拦截所有的 .do 请求但不包含tologin.do
		//jsp文件已经放到web-inf下 不用过滤 只过滤 .do请求即可
		if(url.contains("register")&&!url.contains("manage")&&!url.contains("buy")) {
			//获取session
			HttpSession session = req.getSession();
			User user=(User) session.getAttribute("user");
			System.out.print(user);
			if(user==null){
				resp.sendRedirect("/shopping");
				System.out.println("aaa");
				return;
			}
			
		}
		
		
		chain.doFilter(req, resp);
		
	}
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}


}
