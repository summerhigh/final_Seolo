package com.seolo.check;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class ViewDAO implements IViewDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<ViewDTO> list(int acNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<ViewDTO> result = new ArrayList<ViewDTO>();
		String sql = " SELECT TYPE, GUNAME, DONGNAME, TITLE"
				   + ", DEPOSIT, WOLSE, JEONSE, MAEMAE, SEC, TP, HJ, CONVENIENCE_TOT, PET"
				   + " FROM VIEW_ALLCHECKLIST"
				   + " WHERE AC_NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, acNo);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			ViewDTO dto = new ViewDTO();
			dto.setType(rs.getString("TYPE"));
			dto.setGuName(rs.getString("GUNAME"));
			dto.setDongName(rs.getString("DONGNAME"));
			dto.setTitle(rs.getString("TITLE"));
			
			dto.setDeposit(rs.getInt("DEPOSIT"));
			dto.setWolse(rs.getInt("WOLSE"));
			dto.setJeonse(rs.getInt("JEONSE"));
			dto.setMaemae(rs.getInt("MAEMAE"));
			
			dto.setSecurity(rs.getDouble("SEC"));
			dto.setTransport(rs.getDouble("TP"));
			dto.setHonjap(rs.getDouble("HJ"));
			dto.setConvenience(rs.getInt("CONVENIENCE_TOT"));
			dto.setPet(rs.getDouble("PET"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<String> strickerList(String type, int no) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<String> guList() throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<String> result = new ArrayList<String>();
		
		String sql = "SELECT GUNAME"
				   + " FROM GU";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
			result.add(rs.getString("GUNAME"));

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public ArrayList<String> dongList(int guNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<String> result = new ArrayList<String>();
		
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

	@Override
	public ArrayList<String> myStickerList(int acNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<String> result = new ArrayList<String>();
		
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

}
