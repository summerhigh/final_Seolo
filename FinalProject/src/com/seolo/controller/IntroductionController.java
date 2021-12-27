package com.seolo.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seolo.dto.IntroductionDTO;
import com.seolo.idao.IIntroductionDAO;

@Controller
public class IntroductionController
{
	/// mybatis 객체 의존성 (자동) 주입~!!!
		
	@Autowired
	private SqlSession sqlSession;
		// 덮어쓰기
		
		// 소개 페이지 - 관리자 version  *******
		// 소개 페이지 조회 
		/*
		@RequestMapping(value = "/introduction.action", method = RequestMethod.GET)
		public String introduction(@RequestParam("content") int in_no, Model model)
		{
			IIntroductionDAO dao = sqlSession.getMapper(IIntroductionDAO.class);

			model.addAttribute("view", dao.view(in_no));

			//@ 객체에 대한 주입
			
			return "WEB-INF/view/Introduction.jsp";
		}
		*/
		// 상세 페이지 조회 // 값을 받아오는건 GET
		@RequestMapping(value = "/introduction.action", method = RequestMethod.GET)
		public String introduction(Model model)
		{
			IIntroductionDAO dao = sqlSession.getMapper(IIntroductionDAO.class);
	
			//int in_no = 1;
			/* dto.setIn_no(in_no); */
			
			// jsp 에 받아오는걸로 ▼ 이거 view 이름 설정한거!!로 보내준다.
			model.addAttribute("view", dao.view());
	
			//@ 객체에 대한 주입
			
			//return "Introduction.jsp";
			return "WEB-INF/view/Introduction.jsp";
		}
			
		
		//소개 페이지 수정 폼 -> 값도 받아야대
		@RequestMapping(value = "/introductionform.action", method=RequestMethod.GET)
		public String introductionform(Model model)
		{
			IIntroductionDAO dao = sqlSession.getMapper(IIntroductionDAO.class);
			
			// 이게 값을 받아오는 구문
			// 이거를 적고 writeintroduction.jsp 로 가서 값을 받아오게 만들어야 함
			model.addAttribute("view", dao.view());
			
			return "WEB-INF/view/WriteIntroduction.jsp";
		}
		
		
		 // 소개 페이지 수정 -> 수정버튼 눌럿을때 수정되는거		// 값을 받고 보내기도하는게 POST
		 @RequestMapping(value = "/introductioninsert.action", method = RequestMethod.POST) 
		  public String introductionUpdate(IntroductionDTO n) 
		  {
			 IIntroductionDAO dao = sqlSession.getMapper(IIntroductionDAO.class);
		  
			 dao.modify(n);
		  
			 // 이거 주소 중요 ! 수정버튼 누르고 어디로가야할지 그 주소를 적어준다~!
			 return "redirect:introduction.action"; 
			 
		  }
		 
		 
		
		// --- 관리자 version 끝-******
		
		// 소개 페이지 - 이용자 version *****
		// 소개 페이지 조회 -> 버튼 없는 version
		/*
		@RequestMapping(value = "/introduction.action", method = RequestMethod.GET)
		public String introductionView(@RequestParam("in_no") int in_no, Model model)
		{
			IIntroductionDAO dao = sqlSession.getMapper(IIntroductionDAO.class);

			model.addAttribute("view", dao.view());

			//@ 객체에 대한 주입
			//@ 해당 메소드(count.list) 에 오버라이딩
			
			return "WEB-INF/view/Introduction_user.jsp";
			// -- 이용자 버전 끝 ------------ *****
		}
*/		

}

