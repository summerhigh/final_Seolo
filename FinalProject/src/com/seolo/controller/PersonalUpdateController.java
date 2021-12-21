package com.seolo.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.idao.IUpdateDAO;
import com.seolo.personal.PersonalDTO;

@Controller
public class PersonalUpdateController
{
	@Autowired
	private SqlSession sqlSession;	// mybatis 객체 의존성(자동) 주입
	
	@RequestMapping(value = "/myinfo.action", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session)
	{
		IUpdateDAO dao = sqlSession.getMapper(IUpdateDAO.class);
		
		if (session.getAttribute("userLogin")==null)	// 로그인 안하면 차단
		{
			return "redirect:main.action";
		}
		else
		{
			PersonalDTO userLogin = (PersonalDTO)session.getAttribute("userLogin");
			String pe_Id = userLogin.getPe_Id();
			
			PersonalDTO user = dao.searchId(pe_Id);
			model.addAttribute("user", user);
		}
		
		return "WEB-INF/view/MyInfo.jsp";
	}
	
	
}
