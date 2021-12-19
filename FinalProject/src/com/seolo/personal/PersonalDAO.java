package com.seolo.personal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class PersonalDAO implements IPersonalDAO
{
	//주요속성 구성 -> 인터페이스
	private DataSource dataSource;
	
	//setter
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	
	@Override
	public int add(PersonalDTO personal) throws SQLException	// 회원가입
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "{call PRC_ACCOUNT_CREATE(?,?,?,?,?,?,?,?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, personal.getPe_Id());
		cstmt.setString(2, personal.getName());
		cstmt.setString(3, personal.getTel());
		cstmt.setString(4, personal.getNickName());
		cstmt.setString(5, personal.getPw());
		cstmt.setString(6, personal.getEmail());
		cstmt.setString(7, personal.getRoadAddr());
		cstmt.setString(8, personal.getDetailAddr());
		result = cstmt.executeUpdate();
		
		cstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int searchIdCount(String name, String tel) throws SQLException // 해당 이름과 전화번호가 맞는지 확인 메소드
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT FROM PERSONAL WHERE NAME=? AND TEL=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 오버로딩
	// 비밀번호 확인을위해 해당 아이디, 이름,전화번호가 맞는지 확인 메소드
	public int searchIdCount(String name, String tel, String id) throws SQLException 
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT FROM PERSONAL WHERE NAME=? AND TEL=? AND PE_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		pstmt.setString(3, id);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}	
	
	

	@Override
	public String searchId(String name, String tel) throws SQLException		// 아이디 찾기 메소드
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT PE_ID FROM PERSONAL WHERE NAME=? AND TEL=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getString("PE_ID"); 
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 비밀번호 변경 메소드
	@Override
	public int pwdModify(String id, String pw) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE PERSONAL SET PW = ? WHERE PE_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pw);
		pstmt.setString(2, id);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	
   // ★ 소연 수정 시작
	@Override
	   public PersonalDTO login(String id, String pw) throws SQLException // 일반회원 로그인 메소드
	   {
	      PersonalDTO result = new PersonalDTO();
	      
	      Connection conn = dataSource.getConnection();
	      String sql = "SELECT PE_ID, AC_NO, NICKNAME, WARNING_COUNT(AC_NO) as WARNINGCOUNT FROM PERSONAL WHERE PE_ID=? AND PW=?";
	      // 성공적으로 로그인했을 경우 회원정보 반환
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, id);
	      pstmt.setString(2, pw);
	      ResultSet rs = pstmt.executeQuery();
	      if (rs.next())
	      {
	         result.setPe_Id(rs.getString(1));
	         result.setAc_No(rs.getString(2));
	         result.setNickName(rs.getString(3));
	         result.setWarningCount(rs.getInt(4));
	      }

	      rs.close();
	      pstmt.close();
	      conn.close();

	      return result;
	   }





   @Override
   public int confirmId(String id) throws SQLException   // 아이디 중복확인(ajax) (result가 1이면 중복)
   {
      int result=0;
      
      Connection conn = dataSource.getConnection();
      String sql="SELECT COUNT(*) FROM PERSONAL WHERE PE_ID=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next())
         result = rs.getInt(1);
      rs.close();
      pstmt.close();
      conn.close();
      
      return result;
   }

   @Override
   public int confirmTel(String tel) throws SQLException   // 휴대전화 중복확인 - personal 테이블 (ajax) (result가 1이면 중복)
   {
      int result=0;
      
      Connection conn = dataSource.getConnection();
      String sql="SELECT COUNT(*) FROM PERSONAL WHERE TEL=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, tel);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next())
         result = rs.getInt(1);
      rs.close();
      pstmt.close();
      conn.close();
      
      return result;
   }

   @Override
   public int confirmTel2(String tel) throws SQLException   // 가입시 가입 가능한 휴대전화인지 - withdrawal 테이블 (ajax) (result가 1이면 가입불가)
   {
      int result=0;
      
      Connection conn = dataSource.getConnection();
      String sql="SELECT COUNT(*) FROM WITHDRAWAL WHERE TEL=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, tel);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next())
         result = rs.getInt(1);
      rs.close();
      pstmt.close();
      conn.close();
      
      return result;
   }

   @Override
   public int confirmNick(String nickname) throws SQLException   // 닉네임 중복확인(ajax) (result가 1이면 중복)
   {
      int result=0;
      
      Connection conn = dataSource.getConnection();
      String sql="SELECT COUNT(*) FROM PERSONAL WHERE NICKNAME=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, nickname);      
      ResultSet rs = pstmt.executeQuery();
      if (rs.next())
         result = rs.getInt(1);
      rs.close();
      pstmt.close();
      conn.close();
      
      return result;
   }	

	
		

}
