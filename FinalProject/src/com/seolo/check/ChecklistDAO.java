package com.seolo.check;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ChecklistDAO implements IChecklistDAO
{
   private DataSource dataSource;

   public void setDataSource(DataSource dataSource)
   {
      this.dataSource = dataSource;
   }

   // 체크리스트 등록(추가)
   @Override
   public int add(ChecklistDTO dto) throws SQLException
   {
      Connection conn = dataSource.getConnection();

      int result = 0;

      // String sql = "{call 프로시저 이름(매개변수)}";
      // 매개변수 34개 
      // checkNo, acNo, resNo, checkdate, title, roadaddr, dongNo, wido, gyeongdo, good
      // bad, etc, s_comments, mart, laundry, hospital, food, culture, park, c_comments
      // mwolse, deposit, mjeonse, mmaemae, place, time, p_comments, p_scoreno, se_comments, se_scoreno
      // t_comments, t_scoreno, h_comments, h_scoreno

      String sql = "{call PRC_CHECKLIST_INSERT(?,?,SYSDATE,?,?,?,?,?,? ,?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,? ,?,?,?,?)}";

      CallableStatement cstmt = conn.prepareCall(sql);

      // cstmt.setInt(1, dto.getCheckNo()); 체크고유번호는 시퀀스
      cstmt.setInt(1, dto.getAcNo());
      cstmt.setInt(2, dto.getResNo());
      // cstmt.setString(3, dto.getCheckDate()); 작성일시도 sysdate하기로함
      cstmt.setString(3, dto.getTitle());
      cstmt.setString(4, dto.getRoadAddr());
      cstmt.setInt(5, dto.getDongNo());
      cstmt.setString(6, dto.getWido());
      cstmt.setString(7, dto.getGyeongdo());
     
      cstmt.setString(8, dto.getGood());
      cstmt.setString(9, dto.getBad());
      cstmt.setString(10, dto.getEtc());
      
      cstmt.setString(11, dto.getSecret_co());
      cstmt.setInt(12, dto.getMart());
      cstmt.setInt(13, dto.getLaundry());
      cstmt.setInt(14, dto.getHospital());
      cstmt.setInt(15, dto.getFood());
      cstmt.setInt(16, dto.getCulture());
      cstmt.setInt(17, dto.getPark());
      cstmt.setString(18, dto.getConv_co());

      cstmt.setInt(19, dto.getmWolse());
      cstmt.setInt(20, dto.getDeposit());
      cstmt.setInt(21, dto.getmJeonse());
      cstmt.setInt(22, dto.getmMaemae());
      
      cstmt.setString(23, dto.getPlace());
      cstmt.setInt(24, dto.getTime());
      
      cstmt.setString(25, dto.getPet_co());
      cstmt.setInt(26, dto.getPet_scoreNo());
      
      cstmt.setString(27, dto.getSecurity_co());
      cstmt.setInt(28, dto.getSecurity_scoreNo());

      cstmt.setString(29, dto.getTransport_co());
      cstmt.setInt(30, dto.getTransport_scoreNo());
      
      cstmt.setString(31, dto.getHonjap_co());
      cstmt.setInt(32, dto.getHonjap_scoreNo());

      result = cstmt.executeUpdate();

      cstmt.close();
      conn.close();

      return result;
   }

   // 체크리스트 수정
   @Override
   public int modify(ChecklistDTO dto) throws SQLException
   {
      Connection conn = dataSource.getConnection();

      int result = 0;

      String sql = "{call PRC_CHECKLIST_UPDATE(?,?,SYSDATE,?,?,?,?,?,? ,?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,? ,?,?,?,?)}";

      CallableStatement cstmt = conn.prepareCall(sql);

      // cstmt.setInt(1, dto.getCheckNo()); 체크고유번호는 시퀀스
      cstmt.setInt(1, dto.getAcNo());
      cstmt.setInt(2, dto.getResNo());
      // cstmt.setString(3, dto.getCheckDate()); 작성일시도 sysdate하기로함
      cstmt.setString(3, dto.getTitle());
      cstmt.setString(4, dto.getRoadAddr());
      cstmt.setInt(5, dto.getDongNo());
      cstmt.setString(6, dto.getWido());
      cstmt.setString(7, dto.getGyeongdo());
     
      cstmt.setString(8, dto.getGood());
      cstmt.setString(9, dto.getBad());
      cstmt.setString(10, dto.getEtc());
      
      cstmt.setString(11, dto.getSecret_co());
      cstmt.setInt(12, dto.getMart());
      cstmt.setInt(13, dto.getLaundry());
      cstmt.setInt(14, dto.getHospital());
      cstmt.setInt(15, dto.getFood());
      cstmt.setInt(16, dto.getCulture());
      cstmt.setInt(17, dto.getPark());
      cstmt.setString(18, dto.getConv_co());

      cstmt.setInt(19, dto.getmWolse());
      cstmt.setInt(20, dto.getDeposit());
      cstmt.setInt(21, dto.getmJeonse());
      cstmt.setInt(22, dto.getmMaemae());
      
      cstmt.setString(23, dto.getPlace());
      cstmt.setInt(24, dto.getTime());
      
      cstmt.setString(25, dto.getPet_co());
      cstmt.setInt(26, dto.getPet_scoreNo());
      
      cstmt.setString(27, dto.getSecurity_co());
      cstmt.setInt(28, dto.getSecurity_scoreNo());

      cstmt.setString(29, dto.getTransport_co());
      cstmt.setInt(30, dto.getTransport_scoreNo());
      
      cstmt.setString(31, dto.getHonjap_co());
      cstmt.setInt(32, dto.getHonjap_scoreNo());

      result = cstmt.executeUpdate();

      cstmt.close();
      conn.close();

      return result;
   }

   // 체크리스트 삭제
   @Override
   public int remove(int checkNo) throws SQLException
   {
      Connection conn = dataSource.getConnection();

      int result = 0;

      String sql = "{call PRC_CHECKLIST_DELETE(?)}";

      CallableStatement cstmt = conn.prepareCall(sql);
      cstmt.setInt(1, checkNo);

      result = cstmt.executeUpdate();

      cstmt.close();
      conn.close();

      return result;
   }

   // 체크고유번호로 체크리스트 가져오기
   @Override
   public ChecklistDTO searchId(int checkNo) throws SQLException
   {
      Connection conn = dataSource.getConnection();

      ChecklistDTO result = new ChecklistDTO();

      String sql = "SELECT CHECK_NO, AC_NO, RES_NO, CHECKDATE, TITLE" + ", ROADADDR, DONG_NO, WIDO, GYEONGDO"
            + " FROM CHECKLIST" + " WHERE CHECK_NO = ?";

      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, checkNo);

      ResultSet rs = pstmt.executeQuery();
      while (rs.next())
      {
         result.setCheckNo(rs.getInt("CHECK_NO"));
         result.setAcNo(rs.getInt("AC_NO"));
         result.setResNo(rs.getInt("RES_NO"));
         result.setCheckDate(rs.getString("CHECKDATE"));
         result.setTitle(rs.getString("TITLE"));
         result.setRoadAddr(rs.getString("ROADADDR"));
         result.setDongNo(rs.getInt("DONG_NO"));
         result.setWido(rs.getString("WIDO"));
         result.setGyeongdo(rs.getString("GYEONGDO"));
      }

      rs.close();
      pstmt.close();
      conn.close();

      return result;

   }

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

   // 점수리스트 가져오기(0.0 ~ 5.0)   // int를 String으로 변환했어.... 이케하는게 맞나
   @Override
   public ArrayList<String> scoreList() throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT SCORENO, SCORENAME FROM SCORE";

      PreparedStatement pstmt = conn.prepareStatement(sql);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(Integer.toString(rs.getInt("SCORENAME")));
      
      rs.close();
      pstmt.close();
      conn.close();

      return result;
   }

   // 거주리스트 가져오기(거주, 비거주)
   @Override
   public ArrayList<String> residenceList() throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT RESIDENCENO, RESIDENCENAME FROM RESIDENCE";

      PreparedStatement pstmt = conn.prepareStatement(sql);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
    	  result.add(rs.getString("RESIDENCENAME"));

      rs.close();
      pstmt.close();
      conn.close();

      return result;
   }

   // 구 전체리스트 가져오기
   @Override
   public ArrayList<String> guList() throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT GUNO, GUNAME FROM GU";

      PreparedStatement pstmt = conn.prepareStatement(sql);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(rs.getString("GUNAME"));
      
      rs.close();
      pstmt.close();
      conn.close();

      return result;
   }

   // 구에 해당하는 동 전체리스트 가져오기
   @Override
   public ArrayList<String> dongList(int guNo) throws SQLException
   {
      ArrayList<String> result = new ArrayList<String>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT DONGNAME FROM DONG WHERE GU_NO = ?";

      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, guNo);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
         result.add(rs.getString("DONGNAME"));

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
   
   // 추가 : dongName을 통해 dongNo 얻어내는 메소드..
   public int searchDong(String dongName) throws SQLException
   {
      int result = 0;
      
      Connection conn = dataSource.getConnection();
      
      String sql = "SELECT DONGNO FROM DONG WHERE DONGNAME = ?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dongName);
      
      ResultSet rs = pstmt.executeQuery();
      while (rs.next())
         result = rs.getInt("DONGNO");

      rs.close();
      pstmt.close();
      conn.close();
      
      return result;
   }

}