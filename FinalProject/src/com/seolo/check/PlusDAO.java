/*
package com.seolo.check;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class PlusDAO implements IPlusDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	

	// 추가항목 등록(시간)
	@Override
	public int addTime(PlusDTO dto) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		int result = 0;
		
		String sql = "INSERT INTO PLUS_TIME(PTIME_NO, CHECK_NO, TITLE, COMMENTS, TIME)"
				+ " VALUES(PLSTIMESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getCheck_no());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getComments());
		pstmt.setInt(4, dto.getTime());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 추가항목 등록(점수)
	@Override
	public int addScore(PlusDTO dto) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		int result = 0;
		
		String sql = "INSERT INTO PLUS_SCORE(PSCORE_NO, CHECK_NO, TITLE, COMMENTS, SCORENO)"
				+ " VALUES(PLSSCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getCheck_no());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getComments());
		pstmt.setInt(4, dto.getScoreNo());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	

	// 추가항목 수정 (시간)
	@Override
	public int modifyTime(PlusDTO dto) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		int result = 0;
		
		String sql = "UPDATE PLUS_TIME SET TITLE=?, COMMENTS=?, TIME=? WHERE PTIME_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getComments());
		pstmt.setInt(3, dto.getTime());
		pstmt.setInt(4, dto.getpTime_no());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 추가항목 수정 (점수)
	@Override
	public int modifyScore(PlusDTO dto) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		int result = 0;
		
		String sql = "UPDATE PLUS_SCORE SET TITLE=?, COMMENTS=?, SCORENO=? WHERE PSCORE_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getComments());
		pstmt.setInt(3, dto.getScoreNo());
		pstmt.setInt(4, dto.getpScore_no());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
		
		

	// 추가항목 삭제 (시간)
	@Override
	public int removeTime(int pTime_no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		int result = 0;
		
		String sql = "DELETE FROM PLUS_TIME WHERE PTIME_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pTime_no);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 추가항목 삭제 (점수)
	@Override
	public int removeScore(int pScore_no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		int result = 0;
		
		String sql = "DELETE FROM PLUS_SCCORE WHERE PSCORE_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pScore_no);
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 추가고유번호로 추가항목 내용 찾기 (시간)
	@Override
	public PlusDTO searchTimeId(int pTime_no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		PlusDTO result = new PlusDTO();
		
		String sql = "SELECT PTIME_NO, CHECK_NO, TITLE, COMMENTS, TIME FROM PLUS_TIME WHERE PTIME_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pTime_no);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setpTime_no(rs.getInt("PTIME_NO"));
			result.setCheck_no(rs.getInt("CHECK_NO"));
			result.setTitle(rs.getString("TITLE"));
			result.setComments(rs.getString("COMMENTS"));
			result.setTime(rs.getInt("TIME"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 추가고유번호로 추가항목 내용 찾기 (점수)
	@Override
	public PlusDTO searchScoreId(int pScore_no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		PlusDTO result = new PlusDTO();
		
		String sql = "SELECT PSCORE_NO, CHECK_NO, TITLE, COMMENTS, SCORENO FROM PLUS_SCORE WHERE PSCORE_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pScore_no);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setpScore_no(rs.getInt("PSCORE_NO"));
			result.setCheck_no(rs.getInt("CHECK_NO"));
			result.setTitle(rs.getString("TITLE"));
			result.setComments(rs.getString("COMMENTS"));
			result.setScoreNo(rs.getInt("SCORENO"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 체크고유번호로 추가항목 리스트 찾기 (시간)
	@Override
	public ArrayList<PlusDTO> plusTimeList(int checkNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		ArrayList<PlusDTO> result = new ArrayList<PlusDTO>();

		String sql = "SELECT PTIME_NO, CHECK_NO, TITLE, COMMENTS, TIME FROM PLUS_TIME WHERE CHECK_NO =?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, checkNo);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			PlusDTO dto = new PlusDTO();
			
			dto.setpTime_no(rs.getInt("PTIME_NO"));
			dto.setCheck_no(rs.getInt("CHECK_NO"));
			dto.setTitle(rs.getString("TITLE"));
			dto.setComments(rs.getString("COMMENTS"));
			dto.setTime(rs.getInt("TIME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 체크고유번호로 추가항목 리스트 찾기 (점수)
	@Override
	public ArrayList<PlusDTO> plusScoreList(int checkNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		ArrayList<PlusDTO> result = new ArrayList<PlusDTO>();

		String sql = "SELECT PSCORE_NO, CHECK_NO, TITLE, COMMENTS, SCORENO FROM PLUS_SCORE WHERE CHECK_NO =?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, checkNo);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			PlusDTO dto = new PlusDTO();
			
			dto.setpScore_no(rs.getInt("PSCORE_NO"));
			dto.setCheck_no(rs.getInt("CHECK_NO"));
			dto.setTitle(rs.getString("TITLE"));
			dto.setComments(rs.getString("COMMENTS"));
			dto.setScoreNo(rs.getInt("SCORENO"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

}*/
