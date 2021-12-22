/*==========================
   AdminController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.admin.INoticeDAO;
import com.seolo.admin.NoticeDTO;
import com.seolo.personal.PersonalDTO;

@Controller
public class AdminController
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
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("list", dao.list());
		model.addAttribute("catelist", dao.catelist());

		//@ 객체에 대한 주입
		//@ 해당 메소드(count.list) 에 오버라이딩
		
		return "WEB-INF/view/NoticeList.jsp";
	}
	
	@RequestMapping(value = "/writenotice.action", method = RequestMethod.GET)
	public String writeNotice(Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		return "WEB-INF/view/WriteNotice.jsp";
	}

	@RequestMapping(value = "/noticeinsert.action", method = RequestMethod.POST)
	public String noticeInsert(NoticeDTO n)
	{
		
		// AC_NO, 관리자 아이디 받아와서 테이블에 insert 해줘야 함!
		
	      // 체크 고유번호는 시퀀스를 통해 알아서 입력
	      // AC_NO를 세션속성으로 받아온다.
		/*
	      HttpSession session = request.getSession();
	      PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
	      int acNo = Integer.parseInt(user.getAc_No());
		*/
		
		/*
		// 1. 세션에 담겨있는 유저 객체 꺼내기
    	Map<String,Object> userVo =session.getAttribute(LOGIN); 
    	// 로그인 인터셉터에서 세션에 담은 userVo 가 java.util.Map 이라는 가정
		// 2. 조회조건 객체에 유저 정보 넣기
		cri.setUserName((String)userVo.get("userName"); // 실제 소스에 맞게 고치세요. 
		*/
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.add(n);
		
		return "redirect:noticelist.action";
	}

}
