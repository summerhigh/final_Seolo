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

public class PersonalInsertFormController implements Controller
{
	private IPersonalDAO dao;
	
	public void setDao(IPersonalDAO dao)
	{
		this.dao = dao;
		
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리-------------------------------------------------------------------------------
	      HttpSession session = request.getSession();
	      
	      if (session.getAttribute("userLogin")!=null)   // 로그인 폼은 로그인 된사람이 접근하면 안 됨
	      {
	          mav.setViewName("redirect:main.action");
	         return mav;
	      }
	      // 세션 처리-------------------------------------------------------------------------------
	    
	    // 약관동의 안하고 주소로 들어온사람 내쫓기
	    if (request.getParameter("confirm") == null)
		{
	    	mav.setViewName("redirect:main.action");
	        return mav;
		}
		
		mav.setViewName("WEB-INF/view/CreateAccountInsert.jsp");
		
		return mav;

	}
}
