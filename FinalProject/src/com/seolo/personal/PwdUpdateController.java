/*==========================
   SampleController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PwdUpdateController implements Controller
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
		
		String userId = request.getParameter("userId");
		String newPwd = request.getParameter("newPwd");
		
		try
		{
			int result = dao.pwdModify(userId, newPwd);

			if (result == 1)
			{
				mav.setViewName("WEB-INF/view/pwdResetFn.jsp");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;

	}
}
