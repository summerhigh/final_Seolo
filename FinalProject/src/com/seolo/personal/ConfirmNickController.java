/*==========================
   ConfirmNickController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ConfirmNickController implements Controller
{
	// 인터페이스
	private IPersonalDAO dao;
	
	// setter 구성
	public void setDao(IPersonalDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String nickName = request.getParameter("nickName");
		int result = 0;
		
		try
		{
			result = dao.confirmNick(nickName);
			
			mav.addObject("result", result);
			mav.setViewName("/WEB-INF/view/confirmNick.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;

	}
}
