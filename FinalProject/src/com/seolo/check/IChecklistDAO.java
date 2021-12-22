package com.seolo.check;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IChecklistDAO
{
   //○ '나의 체크리스트' 게시글에 관한 작업(등록, 수정, 삭제...) 시 사용
   public int add(ChecklistDTO dto) throws SQLException;
   public int modify(ChecklistDTO dto) throws SQLException;
   public int remove(int checkNo) throws SQLException;
   public ChecklistDTO searchId(int checkNo) throws SQLException;

   // public ArrayList<String> strickerList(int checkNo) throws SQLException;
   // 쟤 지우고 세분화하여 아래 3개로 정의!!
   public ArrayList<String> checkSticker(int checkNo) throws SQLException;
   public ArrayList<String> localSticker(int dongNo) throws SQLException;
   public ArrayList<String> myCheckSticker(int checkNo) throws SQLException;
   public ArrayList<String> myStickerList(int acNo) throws SQLException;
   public ArrayList<ScoreDTO> scoreList() throws SQLException;
   public ArrayList<String> residenceList() throws SQLException;
   public ArrayList<String> guList() throws SQLException;
   public ArrayList<String> dongList(int guNo) throws SQLException;
   
   // 추가 : dongName을 통해 dongNo 얻어내는 메소드..(현 체크리스트에서 dongName을 받아올 방법이 없어서)
   public int searchDong(String dongName) throws SQLException;

   // 20211220 추가
   public ArrayList<String> dongs() throws SQLException;
   
   // 동코드를 통해서 값이 있으면 1, 없으면 0 count 메소드
   public int checkdong(String dongNo) throws SQLException;
   
   // dongNo로 dongName 얻어내기
   public String searchDongName(String dongNo) throws SQLException;
   
   // dongNo로 guName 알아내기
   public String searchGuName(int dongNo) throws SQLException; 
}