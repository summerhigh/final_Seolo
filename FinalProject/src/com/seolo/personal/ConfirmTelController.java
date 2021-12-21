/*==========================
   SampleController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ConfirmTelController implements Controller
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
		
		String tel = request.getParameter("tel");
		
		try
		{
			int perResult = dao.confirmTel(tel);
			int withResult = dao.confirmTel2(tel);

			StringBuffer sb = new StringBuffer();
			
			/* 따옴표 구성에 유의할 것~!!! */
			sb.append("{\"perResult\":\"" + perResult + "\",");
			sb.append("\"withResult\":\"" + withResult + "\"}");
			mav.addObject("result", sb.toString());
			
			mav.setViewName("WEB-INF/view/AjaxTelSearch.jsp");
		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;

	}
}
