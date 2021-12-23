/*====================================
   CheckFirstInsertController.java
=====================================*/

package com.seolo.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.seolo.dto.ChecklistDTO;
import com.seolo.idao.IChecklistDAO;
import com.seolo.personal.PersonalDTO;

public class CheckFirstInsertController implements Controller
{
   private IChecklistDAO dao;

   public void setDao(IChecklistDAO dao)
   {
      this.dao = dao;
   }

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
   {
      ModelAndView mav = new ModelAndView();
      
      // 데이터 받기
      
      // 체크 고유번호는 시퀀스를 통해 알아서 입력
      // AC_NO를 세션속성으로 받아온다.
      /*
      HttpSession session = request.getSession();
      
      PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
      
      int acNo = Integer.parseInt(user.getAc_No());
      */
      
      int acNo =28;
      
      int resNo = Integer.parseInt(request.getParameter("resNo"));
      
      // checkdate도 sysdate로 처리돼서 매개변수 없이 처리됨
      
      String title = request.getParameter("title");
      String roadAddr = request.getParameter("roadAddr");
      String dongName = request.getParameter("dongName");
      
      int dongNo = dao.searchDong(dongName);
      
      
      String good = request.getParameter("good");
      String bad = request.getParameter("bad");
      String etc = request.getParameter("etc");
      String secret_co = request.getParameter("secret_co");
      
      // 라디오버튼은 같은 이름 여러개중에 선택값만 넘어감
      int mart = Integer.parseInt(request.getParameter("mart"));
      int laundry = Integer.parseInt(request.getParameter("laundry"));
      int hospital = Integer.parseInt(request.getParameter("hospital"));
      int food = Integer.parseInt(request.getParameter("food"));
      int culture = Integer.parseInt(request.getParameter("culture"));
      int park = Integer.parseInt(request.getParameter("park"));      
      String conv_co = request.getParameter("conv_co");
      
      int mWolse = Integer.parseInt(request.getParameter("mWolse"));
      int deposit = Integer.parseInt(request.getParameter("deposit"));
      int mJeonse = Integer.parseInt(request.getParameter("mJeonse"));
      int mMaemae = Integer.parseInt(request.getParameter("mMaemae"));

      
      String pet_co = null;
      Object pet_scoreNo = null;
      String security_co = null;
      Object security_scoreNo = null;
      String transport_co =null;
      Object transport_scoreNo = null;
      String honjap_co = null;
      Object honjap_scoreNo = null;
      
      if (request.getParameter("pet_co")!=null)
    	  pet_co = request.getParameter("pet_co");
      
      if(Integer.parseInt(request.getParameter("pet_scoreNo"))!=-1)
    	  pet_scoreNo = Integer.parseInt(request.getParameter("pet_scoreNo"));
      
      if (request.getParameter("security_co")!=null)
    	  security_co = request.getParameter("security_co");
      
      if(Integer.parseInt(request.getParameter("security_scoreNo"))!=-1)
    	  security_scoreNo = Integer.parseInt(request.getParameter("security_scoreNo"));
      
      if (request.getParameter("transport_co")!=null)
    	  transport_co = request.getParameter("transport_co");
      
      if(Integer.parseInt(request.getParameter("transport_scoreNo"))!=-1)
    	  transport_scoreNo = Integer.parseInt(request.getParameter("transport_scoreNo"));

      if (request.getParameter("honjap_co")!=null)
    	  honjap_co = request.getParameter("honjap_co");
      
      if(Integer.parseInt(request.getParameter("honjap_scoreNo"))!=-1)
     	honjap_scoreNo = Integer.parseInt(request.getParameter("honjap_scoreNo"));
      
      try
	{
    	  ChecklistDTO dto = new ChecklistDTO();
    	  
    	  dto.setAcNo(acNo);
    	  dto.setResNo(resNo);
    	  dto.setTitle(title);
    	  dto.setRoadAddr(roadAddr);
    	  dto.setDongNo(dongNo);
    	  
    	  dto.setGood(good);
    	  dto.setBad(bad);
    	  dto.setEtc(etc);
    	  /*
    	  dto.setSecret_co(secret_co);
    	  dto.setMart(mart);
    	  dto.setLaundry(laundry);
    	  dto.setHospital(hospital);
    	  dto.setFood(food);
    	  dto.setCulture(culture);
    	  dto.setPark(park);
    	  dto.setConv_co(conv_co);
    	  
    	  dto.setmWolse(mWolse);
    	  dto.setDeposit(deposit);
    	  dto.setmJeonse(mJeonse);
    	  dto.setmMaemae(mMaemae);
    	  */
    	  
    	  dto.setPet_co(pet_co);
    	  dto.setPet_scoreNo((int)pet_scoreNo);
    	  
    	  dto.setSecurity_co(security_co);
    	  dto.setSecurity_scoreNo((int)security_scoreNo);
    	  
    	  dto.setTransport_co(transport_co);
    	  dto.setTransport_scoreNo((int)transport_scoreNo);
    	  
    	  dto.setHonjap_co(honjap_co);
    	  dto.setHonjap_scoreNo((int)honjap_scoreNo);
    	  
    	  
    	  // dao.add(dto);
    	  
    	  
    	  // 인서트 시켜주기 + 체크 고유번호 가져다가 넘겨주기
		  // 추가항목 입력 폼 주소 요청하기
		  
    	  // 나중에 WEB-INF로 주소 변경해주기
    	  mav.setViewName("ChecklistWrite_second.jsp");
    	  
    	  
    	  // 지금 계정번호에서 가장 최근에 쓴 체크리스트 번호 가져오기 (sysdate로 정렬해서 첫번째꺼)
    	  
    	  
	} catch (Exception e)
	{
		System.out.println(e.toString());
	}

      return mav;

   }
}