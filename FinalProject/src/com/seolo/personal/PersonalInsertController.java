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

public class PersonalInsertController implements Controller
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
		
		
		
		
		String pe_id = request.getParameter("id");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String pw = request.getParameter("password");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String roadAddr = request.getParameter("roadAddr");
		String detailAddr = request.getParameter("detailAddr");
		
		try
		{
			PersonalDTO personal = new PersonalDTO();
			personal.setPe_Id(pe_id);
			personal.setName(name);
			personal.setNickName(nickName);
			personal.setPw(pw);
			personal.setEmail(email);
			personal.setTel(tel);
			personal.setRoadAddr(roadAddr);
			personal.setDetailAddr(detailAddr);
			
			int result = dao.add(personal);
			
			// result가 0 일때 어떻게 처리해야할지
			
			
			mav.setViewName("WEB-INF/view/CreateAccountInsert_ok.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;

	}
}
