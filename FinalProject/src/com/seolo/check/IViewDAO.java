package com.seolo.check;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IViewDAO
{
	//○ '나의 체크리스트' FORM 조회 시 사용하는 메소드
	public ArrayList<GuDTO> guList() throws SQLException;
	public ArrayList<DongDTO> dongList() throws SQLException;		
	public ArrayList<DongDTO> dongList(int guNo) throws SQLException;
	public ArrayList<StickerDTO> stickerList(int acNo) throws SQLException; 
	
	//○ '나의 체크리스트' 조회 시 사용하는 메소드
	//-- 선택 분기에 따라 분기 : ①구/동 둘 다 선택, ②구만 선택, ③둘 다 선택 안 함
	//-- ※계정과 TYPE 는 언제든지 선택값이 들어감
	//-- ※단, 위 분기는 '동'선택 시 반드시 '구'가 선택되어 있을 때를 전제함(ajax 혹은 javascript로 구현) 
	public ArrayList<ViewDTO> list(int acNo, String type, int guNo, int dongNo, int stickerNo) throws SQLException;
	public ArrayList<ViewDTO> list(int acNo, String type, int guNo, int stickerNo) throws SQLException;
	public ArrayList<ViewDTO> list(int acNo, String type, int stickerNo) throws SQLException;
	
	//○ 각 VIEW 의 스티커 조회 시 사용하는 메소드
	//-- VIEW 의 유형에 따라 분기 : ①나의 체크리스트, ②북마크 체크리스트, ③북마크 지역정보
	public ArrayList<StickerDTO> mycheckStickerList(int no) throws SQLException;
	public ArrayList<StickerDTO> checkBookmarkStickerList(int no) throws SQLException;
	public ArrayList<StickerDTO> localBookmarkStickerList(int no) throws SQLException;
	
}
