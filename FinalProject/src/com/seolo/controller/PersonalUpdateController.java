package com.seolo.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.idao.IUpdateDAO;

@Controller
public class PersonalUpdateController
{
	@Autowired
	private SqlSession sqlSession;	// mybatis 객체 의존성(자동) 주입
	
	@RequestMapping(value = "/myinfo.action", method = RequestMethod.GET)
	public String updateForm(Model model)
	{
		IUpdateDAO dao = sqlSession.getMapper(IUpdateDAO.class);
		
		
		
		return "WEB-INF/view/MyInfo.jsp";
	}
	
	
}
