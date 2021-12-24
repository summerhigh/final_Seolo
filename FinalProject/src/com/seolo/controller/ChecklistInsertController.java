/*=======================================
   ChecklistInsertController.java : 진하
=========================================*/

package com.seolo.controller;

import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.dto.ChecklistDTO;
import com.seolo.idao.IChecklistDAO;


@Controller
public class ChecklistInsertController
{
	@Autowired
	private SqlSession sqlSession;

	// 1번 체크리스트 입력 폼으로 보내준다
	@RequestMapping(value = "/checkfirstinsertform.action", method = RequestMethod.GET)
	public String firstInsertForm(Model model)
	{
		IChecklistDAO dao = sqlSession.getMapper(IChecklistDAO.class);

		model.addAttribute("scores", dao.scoreList());
		// model.addAttribute("residences", dao.residenceList());

		return "ChecklistWrite_first.jsp";
		// return "WEB-INF/view/ChecklistWrite_first.jsp";
	}

	// 1번 체크리스트 입력해준다
	// submit 한 결과니까 post
	@RequestMapping(value = "/checkfirstinsert.action", method = RequestMethod.POST)
	public String firstInsert(Model model, ChecklistDTO dto, HttpServletRequest request)
	{
		IChecklistDAO dao = sqlSession.getMapper(IChecklistDAO.class);

		// 체크 고유번호는 시퀀스를 통해 알아서 입력
		// AC_NO를 세션속성으로 받아온다.
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
		 * 
		 * int acNo = Integer.parseInt(user.getAc_No());
		 */

		int acNo = 28; // 최종 때 얘 빼고 세션으로도 되는지 확인하기!!
		dto.setAcNo(acNo);
		dto.setRoadAddr(request.getParameter("roadAddr1"));
		dto.setDongNo(request.getParameter("bcode"));

		/*
		System.out.println(dto.getAcNo());
		System.out.println(dto.getResNo());
		System.out.println(dto.getDongNo());
		System.out.println(dto.getTitle());
		System.out.println(dto.getRoadAddr());
		*/

		dao.add(dto);

		int checkNo = dao.searchCheckNo(acNo);
		dto.setCheckNo(checkNo);


		if (request.getParameter("mWolse") != null)
		{
			// System.out.println("월세 실행");
			// System.out.println(request.getParameter("mWolse"));
			dao.addWolse(dto);
		}
		if (request.getParameter("mJeonse") != null)
			dao.addJeonse(dto);
		if (request.getParameter("mMaemae") != null)
			dao.addMaemae(dto);

		if (Integer.parseInt(request.getParameter("pet_scoreNo")) != -1)
			dao.addPet(dto);
		if (request.getParameter("pet_co") != null)
			dao.addPetco(dto);

		if (Integer.parseInt(request.getParameter("security_scoreNo")) != -1)
			dao.addSecurity(dto);
		if (request.getParameter("security_co") != null)
			dao.addSecurityco(dto);

		if (Integer.parseInt(request.getParameter("transport_scoreNo")) != -1)
			dao.addTransport(dto);
		if (request.getParameter("transport_co") != null)
			dao.addTransportco(dto);

		if (Integer.parseInt(request.getParameter("honjap_scoreNo")) != -1)
			dao.addHonjap(dto);
		if (request.getParameter("honjap_co") != null)
			dao.addHonjapco(dto);

		if (request.getParameter("good") != null)
			dao.addContentG(dto);
		if (request.getParameter("bad") != null)
			dao.addContentB(dto);
		if (request.getParameter("etc") != null)
			dao.addContentE(dto);

		if (request.getParameter("secret_co") != null)
			dao.addSecret(dto);

		if (request.getParameter("mart") != null) 		// 이걸로 체크하는게 맞나 싶긴한데..
			dao.addConvenience(dto);
		if (request.getParameter("conv_co") != null)
			dao.addConvenienceco(dto);

		
		// 해당 체크리스트 번호 추가항목입력 페이지에 넘겨주기
		model.addAttribute("checkNo", checkNo);

		
		return "ChecklistWrite_second.jsp";
		// return "WEB-INF/view/ChecklistWrite_second.jsp";	최종때 이걸로 바꿔주기
	}

	// 1번 체크리스트에서 주소 ajax 처리한다
	@RequestMapping(value = "/ajax.action", method = RequestMethod.POST)
	public String addressAjax(Model model, HttpServletRequest request)
	{
		IChecklistDAO dao = sqlSession.getMapper(IChecklistDAO.class);

		String bcode = request.getParameter("bcode");

		// System.out.println(bcode);

		int check = dao.checkdong(bcode);

		String result = "";

		if (check == 0)
		{
			result = "해당 지역은 서울이 아닙니다. 다시 검색해주세요";
		} else
		{
			result = dao.searchDongName(bcode);
		}

		model.addAttribute("result", result);

		return "Adress_ok.jsp";
		// return "WEB-INF/view/Adress_ok.jsp";	최종때 이걸로 바꿔주기
	}

	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 시간 추가항목 입력폼으로 보내기
	@RequestMapping(value="/secondtimeinsertform.action", method=RequestMethod.GET)
	public String plusTimeInsertForm(Model model,ChecklistDTO dto, HttpServletRequest request)
	{
		//IChecklistDAO dao = sqlSession.getMapper(IChecklistDAO.class);
		
		// 체크 고유번호는 시퀀스를 통해 알아서 입력
		// AC_NO를 세션속성으로 받아온다.
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
		 * 
		 * int acNo = Integer.parseInt(user.getAc_No());
		 */
		
		int acNo = 28; 		// 최종 때 얘 빼고 세션으로도 되는지 확인하기!!
		dto.setAcNo(acNo);

		// 1번 입력페이지에서 넘겨준 체크리스트 고유번호 받기
		String checkNo = request.getParameter("checkNo");
		
		model.addAttribute("checkNo", checkNo);
		
		return "SecondTimeInsertForm.jsp";
		// return "WEB-INF/view/SecondTimeInsertForm.jsp";
	}

	
	// 점수 추가항목 입력폼으로 보내기
	@RequestMapping(value="/secondscoreinsertform.action", method=RequestMethod.GET)
	public String plusScoreInsertForm(Model model,ChecklistDTO dto, HttpServletRequest request)
	{
		IChecklistDAO dao = sqlSession.getMapper(IChecklistDAO.class);
		
		// 체크 고유번호는 시퀀스를 통해 알아서 입력
		// AC_NO를 세션속성으로 받아온다.
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
		 * 
		 * int acNo = Integer.parseInt(user.getAc_No());
		 */
		
		int acNo = 28;		 // 최종 때 얘 빼고 세션으로도 되는지 확인하기!!
		dto.setAcNo(acNo);

		// 1번 입력페이지에서 넘겨준 체크리스트 고유번호 받기
		// String checkNo = request.getParameter("checkNo");
		
		model.addAttribute("scores", dao.scoreList());
		
		model.addAttribute("checkNo", request.getParameter("checkNo"));
		
		return "SecondScoreInsertForm.jsp";
		// return "WEB-INF/view/SecondScoreInsertForm.jsp";
	}












}



















