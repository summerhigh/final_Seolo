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
      // cstmt.setString(6, dto.getWido());
      // cstmt.setString(7, dto.getGyeongdo());
     
      cstmt.setString(6, dto.getGood());
      cstmt.setString(7, dto.getBad());
      cstmt.setString(8, dto.getEtc());
      
      cstmt.setString(9, dto.getSecret_co());
      cstmt.setInt(10, dto.getMart());
      cstmt.setInt(11, dto.getLaundry());
      cstmt.setInt(12, dto.getHospital());
      cstmt.setInt(13, dto.getFood());
      cstmt.setInt(14, dto.getCulture());
      cstmt.setInt(15, dto.getPark());
      cstmt.setString(16, dto.getConv_co());

      cstmt.setInt(17, dto.getmWolse());
      cstmt.setInt(18, dto.getDeposit());
      cstmt.setInt(19, dto.getmJeonse());
      cstmt.setInt(20, dto.getmMaemae());
      
      cstmt.setString(21, dto.getPlace());
      cstmt.setInt(22, dto.getTime());
      
      cstmt.setString(23, dto.getPet_co());
      cstmt.setInt(24, dto.getPet_scoreNo());
      
      cstmt.setString(25, dto.getSecurity_co());
      cstmt.setInt(26, dto.getSecurity_scoreNo());

      cstmt.setString(27, dto.getTransport_co());
      cstmt.setInt(28, dto.getTransport_scoreNo());
      
      cstmt.setString(29, dto.getHonjap_co());
      cstmt.setInt(30, dto.getHonjap_scoreNo());

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
      // cstmt.setString(6, dto.getWido());		위도경도 빼기로... 
      // cstmt.setString(7, dto.getGyeongdo());
     
      cstmt.setString(6, dto.getGood());
      cstmt.setString(7, dto.getBad());
      cstmt.setString(8, dto.getEtc());
      
      cstmt.setString(9, dto.getSecret_co());
      cstmt.setInt(10, dto.getMart());
      cstmt.setInt(11, dto.getLaundry());
      cstmt.setInt(12, dto.getHospital());
      cstmt.setInt(13, dto.getFood());
      cstmt.setInt(14, dto.getCulture());
      cstmt.setInt(15, dto.getPark());
      cstmt.setString(16, dto.getConv_co());

      cstmt.setInt(17, dto.getmWolse());
      cstmt.setInt(18, dto.getDeposit());
      cstmt.setInt(19, dto.getmJeonse());
      cstmt.setInt(20, dto.getmMaemae());
      
      cstmt.setString(21, dto.getPlace());
      cstmt.setInt(22, dto.getTime());
      
      cstmt.setString(23, dto.getPet_co());
      cstmt.setInt(24, dto.getPet_scoreNo());
      
      cstmt.setString(25, dto.getSecurity_co());
      cstmt.setInt(26, dto.getSecurity_scoreNo());

      cstmt.setString(27, dto.getTransport_co());
      cstmt.setInt(28, dto.getTransport_scoreNo());
      
      cstmt.setString(29, dto.getHonjap_co());
      cstmt.setInt(30, dto.getHonjap_scoreNo());

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

      String sql = "SELECT CHECK_NO, AC_NO, RES_NO, CHECKDATE, TITLE" + ", ROADADDR, DONG_NO"
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
   public ArrayList<ScoreDTO> scoreList() throws SQLException
   {
      ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();

      Connection conn = dataSource.getConnection();

      String sql = "SELECT SCORENO, SCORENAME FROM SCORE";

      PreparedStatement pstmt = conn.prepareStatement(sql);

      ResultSet rs = pstmt.executeQuery();

      while (rs.next())
      {
    	  ScoreDTO dto = new ScoreDTO();
    	  
    	  dto.setScoreNo(rs.getInt("SCORENO"));
    	  dto.setScoreName(rs.getString("SCORENAME"));
    	  
    	  result.add(dto);
      
      }   
        
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

      String sql = "SELECT RES_NO, RESIDENCENAME FROM RESIDENCE";

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
   
   // 추가 : dongName을 통해 dongNo 얻어내는 메소드..  -- 안쓴듯
   @Override
   public int searchDong(String dongName) throws SQLException
   {
      int result = 0;
      
      Connection conn = dataSource.getConnection();
      
      String sql = "SELECT DONG_NO FROM DONG WHERE DONGNAME = ?";
      
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
   

	// 추가 정의!! 모든 동 번호을 가져오기  --안 쓴듯
	@Override
	public ArrayList<String> dongs() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT DONGNO FROM DONG";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
			result.add(rs.getString("DONGNO"));

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}

	// 추가정의!! 동번호가 있는지 확인하기 0이면 없고 1이면 있는거임
	@Override
	public int checkdong(String dongNo) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "SELECT COUNT(*) AS COUNT FROM DONG WHERE DONG_NO = ?";

		// System.out.println("test3");
		PreparedStatement pstmt = conn.prepareStatement(sql);

		/*
		 * System.out.println("------------------------"); System.out.println("1: " +
		 * dongNo); System.out.println("2.5: " + Long.parseLong(dongNo));
		 * System.out.println("2: " + Integer.parseInt(dongNo));
		 * System.out.println("------------------------");
		 * System.out.println("test3.5"); System.out.println(dongNo);
		 * System.out.println(dongNo.getClass().getName());
		 */

		pstmt.setLong(1, Long.parseLong(dongNo));
		// System.out.println("test4");

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}
	
	// 동 번호로 동 이름 가져오기
	public String searchDongName(String dongNo) throws SQLException
	{
		String result = "";

		Connection conn = dataSource.getConnection();

		String sql = "SELECT DONGNAME FROM DONG WHERE DONG_NO = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1, Long.parseLong(dongNo));

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getString("DONGNAME");

		rs.close();
		pstmt.close();
		conn.close();

		return result;
		
	}
	
	// dongNo로 guName 알아내기
	@Override
	public String searchGuName(int dongNo) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT GUNAME FROM GU WHERE GU_NO = (SELECT GU_NO FROM DONG WHERE DONG_NO = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dongNo);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getString("GUNAME");

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}


}