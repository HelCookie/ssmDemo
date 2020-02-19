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
		
		//��ȡ���ʵĵ�ַ
		String url = req.getRequestURI();
		//��ȡsession�еĶ����ж��Ƿ��¼
		//�������е� .do ���󵫲�����tologin.do
		//jsp�ļ��Ѿ��ŵ�web-inf�� ���ù��� ֻ���� .do���󼴿�
		if(url.contains("register")&&!url.contains("manage")&&!url.contains("buy")) {
			//��ȡsession
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
