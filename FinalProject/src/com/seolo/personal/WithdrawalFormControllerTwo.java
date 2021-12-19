/*==========================
   WithdrawalFormControllerTwo.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class WithdrawalFormControllerTwo implements Controller
{

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        ModelAndView mav = new ModelAndView();
        
        // 세션 처리-------------------------------------------------------------------------------
        HttpSession session = request.getSession();
          
        if (session.getAttribute("userLogin")==null || session.getAttribute("confirm")==null)
        // 탈퇴 폼은 로그인 안한사람도, 비밀번호 확인 안한사람도 접근하면 안 됨
        {
           mav.setViewName("redirect:main.action");
           return mav;
        }
        // 세션 처리-------------------------------------------------------------------------------
        
        
        
        mav.setViewName("WEB-INF/view/WithdrawalForm.jsp");
        
        return mav;

    }
}