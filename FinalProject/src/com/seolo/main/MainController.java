/*==========================
   SampleController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MainController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리-------------------------------------------------------------------------------
		/*
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userLogin")==null)	// 로그인이 되어 있지 않은 상황
		{
			mav.setViewName("WEB-INF/view/Main.jsp");
			return mav;
		}
		*/
		// 세션 처리-------------------------------------------------------------------------------
		
		mav.setViewName("WEB-INF/view/Main.jsp");
		
		return mav;

	}
}
