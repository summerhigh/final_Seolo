/*==========================
   SampleController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.check;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyChecklistController implements Controller
{
	private IViewDAO dao;

	public void setDao(IViewDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		ArrayList<ViewDTO> viewList = new ArrayList<ViewDTO>();
		ArrayList<String> guList = new ArrayList<String>();
		
		int acNo = Integer.parseInt(request.getParameter("acNo"));
		
		try
		{
			viewList = dao.list(acNo);
			guList = dao.guList();
			
			mav.addObject("viewList", viewList);
			mav.addObject("guList", guList);
			mav.setViewName("/WEB-INF/view/MyChecklists.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;

	}
}
