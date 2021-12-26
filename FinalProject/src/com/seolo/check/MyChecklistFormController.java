/* ==========================
 * SampleController.java
 * - 사용자 정의 컨트롤러
 * ========================== */

package com.seolo.check;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MyChecklistFormController implements Controller
{
	private IViewDAO dao;

	public void setDao(IViewDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		int acNo = 1; //→ 세션에서 계정정보 확인
		
		ArrayList<GuDTO> guList = new ArrayList<GuDTO>();
		ArrayList<DongDTO> dongList = new ArrayList<DongDTO>();
		ArrayList<StickerDTO> stickerList = new ArrayList<StickerDTO>();
		
		try
		{
			guList = dao.guList();
			dongList = dao.dongList();
			stickerList = dao.stickerList(acNo);

			mav.addObject("guList", guList);
			mav.addObject("dongList", dongList);
			mav.addObject("stickerList", stickerList);
			mav.setViewName("/WEB-INF/view/MyChecklistsForm.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;

	}
}
