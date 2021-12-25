/*==========================
   AdminController.java
   - 공지사항 컨트롤러
==========================*/

package com.seolo.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 공지사항 게시판 조회
	@RequestMapping(value = "/noticelist.action", method = RequestMethod.GET)
	public String noticeList(Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("list", dao.list());
		model.addAttribute("catelist", dao.catelist());
		
		return "WEB-INF/view/NoticeList.jsp";
	}
	
	// 공지사항 게시물 작성 폼으로 이동
	@RequestMapping(value = "/writenotice.action", method = RequestMethod.GET)
	public String writeNotice(Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		return "WEB-INF/view/WriteNotice.jsp";
	}

	// 공지사항 게시물 작성
	// (+) 로그인 세션 작성 후, 관리자 아이디 받아와서 INSERT에 넣어주는 기능 필요
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
	
	// 공지사항 게시물 조회
	@RequestMapping(value = "/noticeview.action", method = RequestMethod.GET)
	public String noticeView(@RequestParam("no_no") int no_no, Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("view", dao.view(no_no));
		
		return "WEB-INF/view/NoticeSee.jsp";
	}
	
	// 공지사항 게시물 수정 폼으로 이동
	@RequestMapping(value = "/noticeupdateform.action", method = RequestMethod.GET)
	public String noticeUpdateform(@RequestParam("no_no") int no_no, Model model)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		model.addAttribute("view", dao.view(no_no));
		
		return "WEB-INF/view/UpdateNotice.jsp";
	}
	
	// 공지사항 게시물 수정
	// 다수의 오류 과정 생겼으나 해결! no_no 번호를 jsp 부분에서 히든으로 넣어서 받아옴
	@RequestMapping(value = "/noticeupdate.action", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO n)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.modify(n);
		
		return "redirect:noticeview.action?no_no=" + n.getNo_no();
	}

	// 공지사항 게시물 삭제
	@RequestMapping(value = "/noticedelete.action", method = RequestMethod.GET)
	public String noticeDelete(NoticeDTO n)
	{
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		dao.remove(n);
		
		return "redirect:noticelist.action";
	}
	
}
