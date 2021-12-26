package com.seolo.controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.dto.AdminDTO;
import com.seolo.idao.IAdminDAO;
import com.seolo.idao.IUpdateDAO;
import com.seolo.personal.PersonalDTO;

@Controller
public class AdminLoginController
{
	
	@Autowired
	private SqlSession sqlSession;
							  
	@RequestMapping(value = "/adminloginform.action", method = RequestMethod.GET)
	public String adminLoginForm(Model model, HttpSession session, HttpServletRequest request)
	{
		
		if (session.getAttribute("userLogin")!=null)	// 일반회원 차단
		{
			return "redirect:main.action";
		}
		
		// 관리자가 로그인했을 경우 페이지 차단 추가
		
		int errMsg = 0;
		
		if (request.getParameter("errMsg") != null)
		{
			errMsg = Integer.parseInt(request.getParameter("errMsg"));
			model.addAttribute("errMsg", errMsg);
			
		}
		
		model.addAttribute("errMsg", errMsg);
		
		return "WEB-INF/view/AdminLogin.jsp";
	}
	
	@RequestMapping(value = "/adminlogin.action", method = RequestMethod.POST)
	public String adminLogin(Model model, AdminDTO dto, HttpServletRequest request)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
	    // dao로부터 받아올 데이터
		AdminDTO adminLogin = null;
		
		adminLogin = dao.login(dto);
		
		//System.out.println(adminLogin);

	    if (adminLogin==null)   // 로그인 실패
	    {
	    	return "redirect:adminloginform.action?errMsg=1";
	    }
	    else	// 로그인 성공 
	    {
	       HttpSession session = request.getSession();      // 세션에 해당 계정의 계정정보 값 부여
	       session.setAttribute("adminLogin", adminLogin);
	       
	       return "redirect:mainadmin.action";
	    }		
		
	}
	
	@RequestMapping(value = "/adminlogout.action", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) 
	{ 
		//AdminDTO sessionCheck = (AdminDTO)session.getAttribute("adminLogin");  
		//System.out.println(sessionCheck);
		session.invalidate();
		
		// 로그아웃시 메인페이지로 이동
		return "redirect:main.action"; 
			   
	  
	}
	  
	 	
	
	
}
