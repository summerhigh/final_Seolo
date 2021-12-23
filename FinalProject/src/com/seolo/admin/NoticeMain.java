/*==========================
   AdminController.java
   - 사용자 정의 컨트롤러
==========================*/
/*
package com.seolo.admin;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeMain
{
	/// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/mainadmin.action", method = RequestMethod.GET)
	public String mainadmin(Model model)
	{
		
		return "WEB-INF/view/Main_admin.jsp";
	}
	
	@RequestMapping(value = "/noticelist.action", method = RequestMethod.GET)
	public String noticeList(Model model)
	{
		
		return "WEB-INF/view/NoticeList.jsp";
	}
	
	@RequestMapping(value = "/writenotice.action", method = RequestMethod.GET)
	public String writeNotice(Model model)
	{
		
		return "WEB-INF/view/WriteNotice.jsp";
	}
}
*/