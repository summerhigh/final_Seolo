/*========================================
   CheckFirstInsertFormController.java
==========================================*/

package com.seolo.check;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.seolo.dto.ScoreDTO;
import com.seolo.idao.IChecklistDAO;

public class CheckFirstInsertFormController implements Controller
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
		
		ArrayList<ScoreDTO> scores = new ArrayList<ScoreDTO>();
		ArrayList<String> residences = new ArrayList<String>();
		
		try
		{
			// 점수 리스트
			scores = dao.scoreList();
			
			// 거주 리스트
			// 근데 라디오버튼에 이 리스트를 활용하질 못했음..
			residences = dao.residenceList();
			
			mav.addObject("scores", scores);
			mav.addObject("residences", residences);
			
			// 나중에 WEB-INF 에 넣게되면 구문 수정해야함!
			mav.setViewName("ChecklistWrite_first.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;

	}
}
