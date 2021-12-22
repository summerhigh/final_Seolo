/*==========================
   AccountListController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.seolo.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seolo.admin.INoticeDAO;
import com.seolo.admin.NoticeDTO;
import com.seolo.idao.IAccountListDAO;
import com.seolo.idao.IWithdrawalAccountListDAO;
import com.seolo.personal.PersonalDTO;

@Controller
public class AccountListController
{
	/// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	
	// 현재 회원 리스트 조회
	@RequestMapping(value = "/accountlist.action", method = RequestMethod.GET)
	public String accountList(Model model)
	{
		IAccountListDAO dao = sqlSession.getMapper(IAccountListDAO.class);
		
		model.addAttribute("list", dao.list());
		model.addAttribute("count", dao.count());
		
		return "WEB-INF/view/AccountList.jsp";
	}
	
	// 탈퇴 회원 리스트 조회
	@RequestMapping(value = "/withdrawalaccountlist.action", method = RequestMethod.GET)
	public String withdrawalaccountList(Model model)
	{
		IWithdrawalAccountListDAO dao = sqlSession.getMapper(IWithdrawalAccountListDAO.class);
		
		model.addAttribute("withdrawallist", dao.withdrawallist());
		model.addAttribute("withdrawalcount", dao.withdrawalcount());
		
		return "WEB-INF/view/WithdrawalAccountList.jsp";
	}
	
	
}
