/*====================================
   CheckFirstInsertController.java
=====================================*/

package com.seolo.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

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
      HttpSession session = request.getSession();
      
      PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
      
      int acNo = Integer.parseInt(user.getAc_No());
      
      
      int resNo = Integer.parseInt(request.getParameter("resNo"));
      
      // checkdate도 sysdate로 처리돼서 매개변수 없이 처리됨
      
      String title = request.getParameter("title");
      String roadAddr = request.getParameter("roadAddr");
      String dongName = request.getParameter("dongName");
      
      int dongNo = dao.searchDong(dongName);
      
      // 위도 경도 해결 못 했음.
      // String wido = request.getParameter("wido");
      // String gyeongdo = request.getParameter("gyeongdo");
      
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

      String place = request.getParameter("place");
      int time = Integer.parseInt(request.getParameter("time"));
      
      String pet_co = request.getParameter("pet_co");
      int pet_scoreNo = Integer.parseInt(request.getParameter("pet_scoreNo"));
      
      String security_co = request.getParameter("security_co");
      int security_scoreNo = Integer.parseInt(request.getParameter("security_scoreNo"));
      
      String transport_co = request.getParameter("transport_co");
      int transport_scoreNo = Integer.parseInt(request.getParameter("transport_scoreNo"));

      String honjap_co = request.getParameter("honjap_co");
      int honjap_scoreNo = Integer.parseInt(request.getParameter("honjap_scoreNo"));
      
      try
	{
    	  ChecklistDTO dto = new ChecklistDTO();
    	  
    	  dto.setAcNo(acNo);
    	  dto.setResNo(resNo);
    	  dto.setTitle(title);
    	  dto.setRoadAddr(roadAddr);
    	  dto.setDongNo(dongNo);
    	  
    	  // 위도 경도도 넘겨야 함..
    	  // dto.setWido(wido);
    	  // dto.setGyeongdo(gyeongdo);
    	  
    	  dto.setGood(good);
    	  dto.setBad(bad);
    	  dto.setEtc(etc);
    	  
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
    	  
    	  dto.setPlace(place);
    	  dto.setTime(time);
    	  
    	  dto.setPet_co(pet_co);
    	  dto.setPet_scoreNo(pet_scoreNo);
    	  
    	  dto.setSecurity_co(security_co);
    	  dto.setSecurity_scoreNo(security_scoreNo);
    	  
    	  dto.setTransport_co(transport_co);
    	  dto.setTransport_scoreNo(transport_scoreNo);
    	  
    	  dto.setHonjap_co(honjap_co);
    	  dto.setHonjap_scoreNo(honjap_scoreNo);
    	  
    	  
    	  dao.add(dto);
    	  
    	  // 첫번째 체크리스트 입력 끝나면 추가항목 입력폼으로 보낸다.
    	  // 근데 이거 redirect가 맞나..?
    	  mav.setViewName("redirect:checksecondinsertform.action");
    	  
    	  
	} catch (Exception e)
	{
		System.out.println(e.toString());
	}

      return mav;

   }
}