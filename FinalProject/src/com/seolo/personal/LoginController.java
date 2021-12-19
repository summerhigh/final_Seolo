/*==========================
   LoginController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LoginController implements Controller
{
   private IPersonalDAO dao;
   
   public void setDao(IPersonalDAO dao)
   {
      this.dao = dao;
   }

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
   {
      ModelAndView mav = new ModelAndView();
      
      // 데이터 수신
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      
      // dao로부터 받아올 데이터
      PersonalDTO userLogin = null;
      
      try
      {
         userLogin = dao.login(id, pwd);
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      if (userLogin.getAc_No()==null)   // 로그인 실패
      {
         mav.setViewName("redirect:loginform.action?errMsg=1");
      }
      else if (userLogin.getWarningCount() >= 10) // 로그인 성공했지만 경고횟수 10회 이상 누적 → 로그인 차단
      {
    	  mav.setViewName("redirect:loginform.action?errMsg=2");
      }
      else	// 로그인 성공 & 경고횟수 10회 이하
      {
         HttpSession session = request.getSession();      // 세션에 해당 계정의 계정정보 값 부여
         session.setAttribute("userLogin", userLogin);
         
         mav.setViewName("redirect:main.action");
      }
      
            
      return mav;

   }
}