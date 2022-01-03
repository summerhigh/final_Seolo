/* ==========================
 * SampleController.java
 * - 사용자 정의 컨트롤러
 * ========================== */

package com.seolo.check;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.seolo.personal.PersonalDTO;

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
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userLogin")==null)
		{
			mav.setViewName("main.action");
			return mav;
		}
		else
		{
			PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
			int acNo= Integer.parseInt(user.getAc_No());

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
}
