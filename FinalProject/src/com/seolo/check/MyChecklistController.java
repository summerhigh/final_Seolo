package com.seolo.check;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.seolo.personal.PersonalDTO;


public class MyChecklistController implements Controller
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
		
		//→ 세션 확인 → 로그인 상태 확인 및 계정정보 받아오기
		HttpSession session = request.getSession();
		if(session.getAttribute("userLogin")==null)
		{
			mav.setViewName("main.action");
			return mav;
		}

		PersonalDTO user = (PersonalDTO)session.getAttribute("userLogin");
		int acNo= Integer.parseInt(user.getAc_No());
		
		
		// ① 선택된 알아볼 내용 값 받아오기
		String type = request.getParameter("typeSelect");	//-- %, 나의 체크리스트, 북마크 체크리스트, 북마크 지역정보
		int guNo = Integer.parseInt(request.getParameter("guSelect"));
		int dongNo = Integer.parseInt(request.getParameter("dongSelect"));
					
		// ② 선택된 비교 값 받아오기
		String[] bigyo = request.getParameterValues("bigyo");
		boolean wolse 			= Arrays.asList(bigyo).contains("wolse");
		boolean jeonse 			= Arrays.asList(bigyo).contains("jeonse");
		boolean maemae 			= Arrays.asList(bigyo).contains("maemae");
		boolean security 		= Arrays.asList(bigyo).contains("security");
		boolean transportation 	= Arrays.asList(bigyo).contains("transportation");
		boolean honjap 			= Arrays.asList(bigyo).contains("honjap");
		boolean conv 			= Arrays.asList(bigyo).contains("conv");
		boolean pet				= Arrays.asList(bigyo).contains("pet");

		// ③ 선택된 스티커 목록 → 스티커 번호
		String[] sticker = request.getParameterValues("sticker");

		// ④ 조회할 뷰 목록 생성
		ArrayList<ViewDTO> viewList = new ArrayList<ViewDTO>();
		ArrayList<ViewDTO> viewListTemp = new ArrayList<ViewDTO>();
		
		try
		{
			// 4-1. 뷰 목록에 값 넣기 : 구·동 선택 여부에 따라 분기
			if (guNo != 0 && dongNo != 0) 	// 구·동 둘 다 선택 O
			{
				for (int i=0; i<sticker.length; i++)
					viewListTemp.addAll(dao.list(acNo, type, guNo, dongNo, Integer.parseInt(sticker[i])));
			}
			else if (guNo != 0) 			// 구만 선택
			{
				for (int i=0; i<sticker.length; i++)
					viewListTemp.addAll(dao.list(acNo, type, guNo, Integer.parseInt(sticker[i])));
			}
			else 							// 구·동 둘 다 선택 X
			{
				for (int i=0; i<sticker.length; i++)
					viewListTemp.addAll(dao.list(acNo, type, Integer.parseInt(sticker[i])));
			}

			
			// 4-2. 뷰 목록에 값이 있다면....
			if (viewListTemp.size() != 0)
			{
				// 4-1. 중복값 제거 
				viewList.add(viewListTemp.get(0));
				
				for (int i=1; i<viewListTemp.size(); i++)		//-- 확인하는 쪽
				{
					boolean flag = false; 						//-- 중복 O: true, 중복 X: false
	
					for(int y=0; y<viewList.size(); y++)		//-- 확인 당하는 쪽
	            	{
	            		if ( viewListTemp.get(i).getType().equals(viewList.get(y).getType())		//-- 타입이 같고
	            				&& viewListTemp.get(i).getMarkNo() == viewList.get(y).getMarkNo() )	//-- 번호가 같은 경우
	            		{
	            			flag = true;
	            			break;
	            		}
	            	}
					
					if(!flag)	//-- 중복이 아닐 경우 저장
	        			viewList.add(viewListTemp.get(i));
	            }
	
				// ⑤ 각 뷰의 스티커 목록 생성
				//　　: 각 뷰의 TYPE에 따라 분기 -- 나의 체크리스트, 북마크 체크리스트, 지역정보 체크리스트
				for (ViewDTO dto : viewList)
				{
					String viewType = dto.getType();
					int no = dto.getMarkNo();
					
					if(viewType.equals("나의 체크리스트"))
						 dto.setStickerList(dao.mycheckStickerList(no));
					else if(viewType.equals("북마크 체크리스트"))
						dto.setStickerList(dao.checkBookmarkStickerList(no));
					else 
						dto.setStickerList(dao.localBookmarkStickerList(no));
				}
				
			}

			
			// ○ 결정된 값 보내기
			mav.addObject("wolse", wolse);
			mav.addObject("jeonse", jeonse);
			mav.addObject("maemae", maemae);
			mav.addObject("security", security);
			mav.addObject("transportation", transportation);
			mav.addObject("honjap", honjap);
			mav.addObject("conv", conv);
			mav.addObject("pet", pet);

			mav.addObject("viewList", viewList);
			
			
			// ○ ViewName 등록
			mav.setViewName("/WEB-INF/view/MyChecklists.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;

	}
}
