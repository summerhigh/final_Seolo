package com.seolo.idao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IStickerDAO
{
	public ArrayList<String> checkSticker(int checkNo) throws SQLException;
	public ArrayList<String> localSticker(int dongNo) throws SQLException;
	public ArrayList<String> myCheckSticker(int checkNo) throws SQLException;
	public ArrayList<String> myStickerList(int acNo) throws SQLException;

	
	
	
	// 기존에 ChecklistDAO에 정의되어있던 스티커 관련 메소드를 여기에 따로 뺌
	/*
	 
   // 북마크해온 체크리스트에 대한 스티커 조회
   @Override
   public ArrayList<String> checkSticker(int checkNo) throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT CONTENT FROM VIEW_CHECKSTICKER WHERE CHECK_NO = ?";

      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, checkNo);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(rs.getString("CONTENT"));

      rs.close();
      pstmt.close();
      conn.close();

      return result;

   }

   // 북마크해온 지역정보에 대한 스티커 조회
   @Override
   public ArrayList<String> localSticker(int dongNo) throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT CONTENT FROM VIEW_LOCALSTICKER WHERE DONGNO = ?";

      PreparedStatement pstmt = conn.prepareStatement(sql);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(rs.getString("CONTENT"));

      rs.close();
      pstmt.close();
      conn.close();

      return result;

   }

   // 내가 작성한 체크리스트에 대한 스티커 조회
   @Override
   public ArrayList<String> myCheckSticker(int checkNo) throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT CONTENT FROM VIEW_MYCHECKSTICKER WHERE CHECK_NO = ?";

      PreparedStatement pstmt = conn.prepareStatement(sql);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(rs.getString("CONTENT"));

      rs.close();
      pstmt.close();
      conn.close();

      return result;

   }
   
   // 나의 스티커 전체 리스트 가져오기
   @Override
   public ArrayList<String> myStickerList(int acNo) throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT CONTENT FROM STICKER WHERE AC_NO = ?";

      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, acNo);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(rs.getString("CONTENT"));

      rs.close();
      pstmt.close();
      conn.close();

      return result;
   }
	 */

}
