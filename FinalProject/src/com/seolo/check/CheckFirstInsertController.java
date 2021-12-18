/*====================================
   CheckFirstInsertController.java
=====================================*/

package com.seolo.check;

import java.util.ArrayList;

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
      
      // 위도 경도 해결 못 했음
      
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
      
      int mwolse = Integer.parseInt(request.getParameter("mwolse"));
      int deposit = Integer.parseInt(request.getParameter("deposit"));
      int mjeonse = Integer.parseInt(request.getParameter("mjeonse"));
      int mmaeame = Integer.parseInt(request.getParameter("mmaeame"));

      String place = request.getParameter("place");
      String time = request.getParameter("time");
      
      String pet_co = request.getParameter("pet_co");
      String pet_scoreNo = request.getParameter("pet_scoreNo");
      
      String security_co = request.getParameter("security_co");
      String security_scoreNo = request.getParameter("security_scoreNo");
      
      String transport_co = request.getParameter("transport_co");
      String transport_scoreNo = request.getParameter("transport_scoreNo");

      String honjap_co = request.getParameter("honjap_co");
      String honjap_scoreNo = request.getParameter("honjap_scoreNo");
      

      /*
      ArrayList<ViewDTO> viewList = new ArrayList<ViewDTO>();
      ArrayList<String> guList = new ArrayList<String>();
      
      int acNo = Integer.parseInt(request.getParameter("acNo"));
      
      try
      {
         viewList = dao.list(acNo);
         guList = dao.guList();
         
         mav.addObject("viewList", viewList);
         mav.addObject("guList", guList);
         mav.setViewName("/WEB-INF/view/MyChecklists.jsp");
      }
      catch (Exception e)
      {
         System.out.println(e.toString());
      }
      */
      
      return mav;

   }
}