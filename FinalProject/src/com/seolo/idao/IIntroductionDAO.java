package com.seolo.idao;

import com.seolo.dto.IntroductionDTO;

public interface IIntroductionDAO
{
	// 관리자 version
	// 필요한 과정을 작성하는 곳
	// 상세 페이지에는 조회, 수정이 필요하다

	
	// 게시물 조회
	// 게시글의 고유번호를 통해서 내용을 가져온다.
	//					   ---- 메소드 이름이 xml 에 가야된다.
	// 매개변수필요없음 왜? content만 받아오면되니가!
	public IntroductionDTO view();

	// 게시물 수정 
	// n 내가 이름 설정한거.
	public int modify(IntroductionDTO n);
	// 				  ------------------
	// 					이거를 가지고 modify 에 사용하고 int 형으로 출력한다.
	//덮어쓰기

}
