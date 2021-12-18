package com.seolo.check;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IViewDAO
{
	//○ '나의 체크리스트' 게시판 조회 시 사용하는 메소드
	public ArrayList<ViewDTO> list(int acNo) throws SQLException;
	public ArrayList<String> strickerList(String type, int no) throws SQLException;
	// ResultSet 를 받아와서 while 문으로 각각의 ViewDTO 를 입력할 때...
	// 받아온 카테고리(지역정보/북마크)와 고유번호로 
	// strickerList() 메소드를 호출하여
	// 각 ViewDTO 의 속성값인 『stickerList』를 채운다.
	
	public ArrayList<String> guList() throws SQLException;
	public ArrayList<String> dongList(int guNo) throws SQLException;
	public ArrayList<String> myStickerList(int acNo) throws SQLException;
}
