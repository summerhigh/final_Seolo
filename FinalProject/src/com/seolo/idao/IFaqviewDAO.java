package com.seolo.idao;

import java.util.ArrayList;

import com.seolo.dto.FaqviewDTO;

public interface IFaqviewDAO
{
	// 자주 묻는 질문 게시판 조회
	public ArrayList<FaqviewDTO> list();
	
	public FaqviewDTO view(int num);
		
	/*
	// 게시물 작성
	public int add(NoticeDTO n);
	
	// 게시물 조회
	public NoticeDTO view(int num);

	// 게시물 수정 
	public int modify(NoticeDTO n);
	
	// 게시물 삭제
	public int remove(NoticeDTO n); 
	*/
	
}	
