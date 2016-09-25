package com.library.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	final static String[]IGNORE_URL= {"login.do","login.jsp","register.do","register.jsp","index.jsp",
		"findBook.jsp", "findBookByID.do", "findBooksByName.do", "options.jsp", "welcome.jsp", "addOneBook.do"};
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handle, Exception ex ) throws Exception{
		
	}
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//super.postHandle(request, response, handler, modelAndView);
	}
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean isLogin=false;
		String requestURL=request.getRequestURI();
		for (String url : IGNORE_URL) {
			if (requestURL.indexOf(url)!=-1) {
				isLogin=true;
				break;
			}
		}
		if (!isLogin) {
			String userName = (String) request.getSession().getAttribute("userName");
			if (userName==null) {
				request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
				return isLogin;
			} else {
				return super.preHandle(request, response, handler);
			}
		} else {
			return super.preHandle(request, response, handler);
		}
	}
}
