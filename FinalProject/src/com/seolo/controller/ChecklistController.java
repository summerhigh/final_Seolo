/*=======================================
   ChecklistInsertController.java : 진하
=========================================*/

package com.seolo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seolo.dto.ChecklistDTO;
import com.seolo.dto.PlusDTO;
import com.seolo.idao.IChecklistDAO;
import com.seolo.idao.IPlusDAO;


@Controller
public class ChecklistController
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
		// dto.setRoadAddr(request.getParameter("roadAddr1"));
		// dto.setDongNo(request.getParameter("bcode"));

		/*
		System.out.println(dto.getAcNo());
		System.out.println(dto.getResNo());
		System.out.println(dto.getDongNo());
		System.out.println(dto.getTitle());
		System.out.println(dto.getRoadAddr());
		*/

		/*
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
		*/
		
		// 여기서 timeList, scoreList 를 받아서 add로 넘겨주고 세컨드 페이지에서  표로 출력하기!!
		
		
		
		// 해당 체크리스트 번호 추가항목입력 페이지에 넘겨주기
		
		//model.addAttribute("checkNo", checkNo);
		model.addAttribute("checkNo", 28);

		
		
		
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

	
	////////두번째 입력폼///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 시간 추가항목 입력폼으로 보내기
	@RequestMapping(value="/secondtimeinsertform.action", method=RequestMethod.GET)
	public String plusTimeInsertForm(Model model,ChecklistDTO dto, HttpServletRequest request)
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
		
		int acNo = 28; 		// 나중에 세션에서 받아와야함
		dto.setAcNo(acNo);

		// 1번 입력페이지에서 넘겨준 체크리스트 고유번호 받기
		// String checkNo = request.getParameter("checkNo");
		
		int checkNo = dao.searchCheckNo(acNo);
		
		// System.out.println(checkNo);
		
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
		
		int acNo = 23;		 // 나중에 세션에서 받아와야함
		dto.setAcNo(acNo);

		// 1번 입력페이지에서 넘겨준 체크리스트 고유번호 받기
		// String checkNo = request.getParameter("checkNo");
		
		int checkNo = dao.searchCheckNo(acNo);
		
		model.addAttribute("scores", dao.scoreList());
		
		model.addAttribute("checkNo", checkNo);
		
		return "SecondScoreInsertForm.jsp";
		// return "WEB-INF/view/SecondScoreInsertForm.jsp";
	}


	// 시간 추가항목 입력
	@RequestMapping(value="/secondtimeinsert.action", method=RequestMethod.GET)
	public String plusTimeInsert(Model model, PlusDTO dto, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);

		// System.out.println("no: " + request.getParameter("checkNo"));
		// System.out.println("title : " + request.getParameter("timeTitle"));
		// System.out.println("time : " + request.getParameter("time"));
		// System.out.println("comment : " + request.getParameter("timeComments"));
		
		// String checkNo = request.getParameter("checkNo");
		
		int acNo = 23;	// 나중에 세션에서 받아와야함
		int checkNo = dao.searchCheckNo(acNo);
		// System.out.println("체크고유번호 : "+ checkNo);
		
		dto.setCheckNo(String.valueOf(checkNo));
		
		// 코멘트가 있을 때 - 전체 입력
		if(request.getParameter("timeComments") != null)
			dao.addTimeco(dto);
		else					
			dao.addTime(dto);
		
		ArrayList<PlusDTO> timeList = new ArrayList<PlusDTO>();
		timeList = dao.timeList(checkNo);
		
		ArrayList<PlusDTO> scoreList = new ArrayList<PlusDTO>();
		
		// 만약 점수 추가항목이 null이 아니라면 리스트를 넘겨주겠다
		if(dao.scoreList(checkNo) != null)
			scoreList = dao.scoreList(checkNo);
		
		
		model.addAttribute("timeList", timeList);
		model.addAttribute("scoreList", scoreList);
		
		return "ChecklistWrite_second.jsp";
	}

	// 점수 추가항목 입력
	@RequestMapping(value="/secondscoreinsert.action", method=RequestMethod.GET)
	public String plusScoreInsert(Model model, PlusDTO dto, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		// System.out.println("title : " + request.getParameter("scoreTitle"));
		// System.out.println("score : " + request.getParameter("scoreNo"));
		// System.out.println("comment : " + request.getParameter("scoreComments"));

		int acNo = 23;		// 임시 나중에 세션에서 받아와야함
		int checkNo = dao.searchCheckNo(acNo);
		// System.out.println("체크고유번호 : "+ checkNo);
		
		dto.setCheckNo(String.valueOf(checkNo));
		
		// 코멘트가 있을 때 - 전체 입력
		if(request.getParameter("scoreComments") != null)
			dao.addScoreco(dto);
		else					
			dao.addScore(dto);
		
		ArrayList<PlusDTO> timeList = new ArrayList<PlusDTO>();
		timeList = dao.timeList(checkNo);
		ArrayList<PlusDTO> scoreList = new ArrayList<PlusDTO>();
		
		if(dao.scoreList(checkNo) != null)
			scoreList = dao.scoreList(checkNo);
		
		model.addAttribute("timeList", timeList);
		model.addAttribute("scoreList", scoreList);
		
		return "ChecklistWrite_second.jsp";
	}


	
	// 시간 추가항목 삭제
	@RequestMapping(value="/secondtimedelete.action", method=RequestMethod.GET)
	public String plusTimeDelete(Model model, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		String plusTimeNo = request.getParameter("plusTimeNo");
		
		dao.removeTime(Integer.parseInt(plusTimeNo));
		
		int acNo = 23;		// 임시 나중에 세션에서 받아와야함
		int checkNo = dao.searchCheckNo(acNo);
		
		// ArrayList<PlusDTO> timeList = dao.timeList(checkNo);
		// ArrayList<PlusDTO> scoreList = dao.scoreList(checkNo);
		
		model.addAttribute("timeList", dao.timeList(checkNo));
		model.addAttribute("scoreList", dao.scoreList(checkNo));
		
		return "ChecklistWrite_second.jsp";
	}

	// 점수 추가항목 삭제
	@RequestMapping(value="/secondscoredelete.action", method=RequestMethod.GET)
	public String plusScoreDelete(Model model, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		String plusScoreNo = request.getParameter("plusScoreNo");
		
		dao.removeScore(Integer.parseInt(plusScoreNo));
		
		int acNo = 23;		// 임시. 나중에 세션에서 받아와야함
		int checkNo = dao.searchCheckNo(acNo);
		
		// ArrayList<PlusDTO> timeList = dao.timeList(checkNo);
		// ArrayList<PlusDTO> scoreList = dao.scoreList(checkNo);
		
		model.addAttribute("timeList", dao.timeList(checkNo));
		model.addAttribute("scoreList", dao.scoreList(checkNo));
		
		
		return "ChecklistWrite_second.jsp";
	}
	
	// 에러 발생 지점. 수정폼으로 보내는거에 대한 컨트롤러 작성하고 dao에 점수리스트 가져오는 메소드 정의하고나서..
	
	
	// 시간 추가항목 수정폼으로 보내기
	@RequestMapping(value="/secondtimeupdateform.action", method=RequestMethod.GET)
	public String plusTimeUpdateForm(Model model, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		int plusTimeNo = Integer.parseInt(request.getParameter("plusTimeNo"));

		model.addAttribute("plusTimeNo", plusTimeNo);
		model.addAttribute("time", dao.plusTime(plusTimeNo));
		
		return "SecondTimeUpdateForm.jsp";
	}
	
	// 점수 추가항목 수정폼으로 보내기
	@RequestMapping(value="/secondscoreupdateform.action", method=RequestMethod.GET)
	public String plusScoreUpdateForm(Model model, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		int plusScoreNo = Integer.parseInt(request.getParameter("plusScoreNo"));
		
		System.out.println("plusScoreNo : " + plusScoreNo);

		model.addAttribute("plusScoreNo", plusScoreNo);
		model.addAttribute("score", dao.plusScore(plusScoreNo));
		model.addAttribute("scores", dao.scores());
		
		return "SecondScoreUpdateForm.jsp";
	}
	
	
	// 시간 추가항목 수정하기 - 다시 2번 폼으로 보내기
	@RequestMapping(value="/secondtimeupdate.action", method=RequestMethod.GET)
	public String plusTimeUpdate(Model model, PlusDTO dto, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		// System.out.println("plusTimeNo : " + request.getParameter("plusTimeNo"));
		// System.out.println("title : " + request.getParameter("timeTitle"));
		// System.out.println("time : " + request.getParameter("time"));
		// System.out.println("comment : " + request.getParameter("timeComments"));
		
		if(request.getParameter("timeComments") != null)
			dao.modifyTimeco(dto);
		else
			dao.modifyTime(dto);
			
		return "ChecklistWrite_second.jsp";
		
	}
	
	// 점수 추가항목 수정하기 - 
	@RequestMapping(value="/secondscoreupdate.action", method=RequestMethod.GET)
	public String plusScoreUpdate(Model model, PlusDTO dto, HttpServletRequest request)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		if(request.getParameter("scoreComments") != null)
			dao.modifyScoreco(dto);
		else
			dao.modifyScore(dto);
			
		return "ChecklistWrite_second.jsp";
		
	}
	

	////////세번째 입력폼///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 스티커 입력폼으로 보내기
	@RequestMapping(value="/thirdinsertform.action", method = RequestMethod.GET)
	public String thirdInsertform(Model model)
	{
		IPlusDAO dao = sqlSession.getMapper(IPlusDAO.class);
		
		int acNo = 23;		// 임시. 나중에 세션에서 받아와야함
		int checkNo = dao.searchCheckNo(acNo);
		
		model.addAttribute("checkNo", checkNo);
		
		
		return "ChecklistWrite_third.jsp";
	}


}



















