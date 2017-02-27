package com.lisi.annualassessment.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionValidateInterceptor implements HandlerInterceptor {

	static int i=0;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	     //System.out.println("after comp");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		String user=	(String) request.getSession().getAttribute("active");
		System.out.println("Interceptor..................................");
		System.out.println("start");
		System.out.println(user);
		System.out.println(user+"   user");
		System.out.println("post handler");
		if(String.valueOf(user).equalsIgnoreCase("null")){
			System.out.println("null enter into the redirectmethod");
			response.sendRedirect("index.jsp");
		}
		System.out.println("end");

		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
	/*	
		
	System.out.println("prehandler............................................");
	System.out.println(i + " i value");
	
	if(i==0 || i==1){
		
	}else{
	String user=	(String) request.getSession().getAttribute("active");
	
	if(String.valueOf(user).equalsIgnoreCase("null")){
		System.out.println("null enter into the redirectmethod");
		response.sendRedirect("redirect:/logout.do");
	}
	}
	
	i++;
		
	//	System.out.println("pre handler");
		return true;
		//
	
	//		
*/	
		return true;	
	}

}
