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

public class PwdSearchTwoController implements Controller
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

		// 세션처리-------------------------------------------------------------------------------
		HttpSession session = request.getSession();

		if (session.getAttribute("userLogin") != null) // 로그인 폼은 로그인 된사람이 접근하면 안 됨
		{
			mav.setViewName("redirect:main.action");
			return mav;
		}
		// 세션처리-------------------------------------------------------------------------------

	      
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String idStr = request.getParameter("id");
		
		try
		{
			int result = dao.searchIdCount(name, tel, idStr);
			String id =	dao.searchId(name, tel);
			
			if (result == 1) 
			{ 
				mav.addObject("id", id);
				mav.setViewName("WEB-INF/view/pwdReset.jsp");
			}
			else 
			{
				mav.setViewName("WEB-INF/view/PwdSearch.jsp");
			}

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;

	}
}
