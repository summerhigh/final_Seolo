/*==========================
   SampleController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PwdSearchOneFormController implements Controller
{
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		// 세션처리-------------------------------------------------------------------------------
		HttpSession session = request.getSession();

		if (session.getAttribute("userLogin") != null) // 로그인 폼은 로그인 된사람이 접근하면 안 됨
		{
			mav.setViewName("redirect:main.action");
			return mav;
		}
		// 세션처리-------------------------------------------------------------------------------

		mav.setViewName("WEB-INF/view/pwdSearchForm1.jsp");
		
		return mav;

	}
}
