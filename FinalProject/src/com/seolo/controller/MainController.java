/*==========================
   MainController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.idao.IMainDAO;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main(Model model)
	{
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		model.addAttribute("noticeList", dao.noticeList());
		model.addAttribute("localList", dao.localList());
		model.addAttribute("checkList", dao.checkList());
		
		return "WEB-INF/view/Main.jsp";
	}
}
