/*======================
   INoticeDAO.java
   - 인터페이스
=======================*/

package com.seolo.admin;

import java.util.ArrayList;

import com.seolo.dto.PageDTO;

public interface INoticeDAO
{	
	// 게시물 목록
	public ArrayList<NoticeDTO> list(PageDTO dto);
	
	// 게시물 카테고리 목록
	public ArrayList<NoticeDTO> catelist();
	
	// 게시물 작성
	public int add(NoticeDTO n);
	
	// 게시물 조회
	public NoticeDTO view(int num);

	// 게시물 수정 
	public int modify(NoticeDTO n);
	
	// 게시물 삭제
	public int remove(NoticeDTO n);
	
	// 게시물 총 개수
	public int count();
	
	
	
}
