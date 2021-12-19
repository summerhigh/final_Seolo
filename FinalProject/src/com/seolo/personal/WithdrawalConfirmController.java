/*==========================
   WithdrawalConfirmController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class WithdrawalConfirmController implements Controller
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
        
        // 세션 처리-------------------------------------------------------------------------------
        HttpSession session = request.getSession();
          
        if (session.getAttribute("userLogin")==null)   // 탈퇴확인 폼은 로그인 안한사람이 접근할 수 없음
        {
           mav.setViewName("redirect:main.action");
           return mav;
        }
        // 세션 처리-------------------------------------------------------------------------------
        
        int errMsg = 0;
        if (request.getParameter("errMsg") != null)   // 비밀번호 확인 실패했을 경우엔 errMsg=1
            errMsg = Integer.parseInt(request.getParameter("errMsg"));
        
        mav.addObject("errMsg", errMsg);
        
        mav.setViewName("WEB-INF/view/WithdrawalConfirm.jsp");
          
        return mav;

    }
}