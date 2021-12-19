/*==========================
   WithdrawalController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class WithdrawalController implements Controller
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
          
        if (session.getAttribute("userLogin")==null || session.getAttribute("confirm")==null)
        // 탈퇴 폼은 로그인 안한사람도, 비밀번호 확인 안한사람도 접근하면 안 됨
        {
           mav.setViewName("redirect:main.action");
           return mav;
        }
        // 세션 처리-------------------------------------------------------------------------------
        
        String agree = request.getParameter("agree");
        String wirNo = request.getParameter("wirNo");
        String comments = request.getParameter("comments");
        PersonalDTO member = (PersonalDTO)session.getAttribute("confirm");
        String acNo = member.getAc_No();
        int result = 0;
        
        if (agree==null || wirNo==null)
        {
            // 동의 체크, 탈퇴 사유에 선택이 안되어있으면 잘못된 접근이므로 메인으로 이동
            mav.setViewName("redirect:main.action");
            return mav;
        }
        
        try
        {
            result = dao.remove(acNo, Integer.parseInt(wirNo), comments);
            
        } catch (Exception e)
        {
            System.out.println(e.toString());
        }
        
        session.invalidate();    // 세션 초기화
        mav.setViewName("WEB-INF/view/WithdrawalFin.jsp");
        
        return mav;

    }
}