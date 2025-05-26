package org.zerock.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class ModuleSetInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object handler)
	throws Exception {
		
		// 권한 처리 진행
		log.info("module setting 처리 Interceptor .................................");
		
		String uri = request.getRequestURI();
		
		int pos = uri.indexOf("/", 1);
		if(pos > 0) request.setAttribute("module", uri.substring(0, pos));
		
		// 요청한 내용을 계속 진행 - 적합한 권한인 경우
		return super.preHandle(request, response, handler);
	} // end of preHandle
	
}
