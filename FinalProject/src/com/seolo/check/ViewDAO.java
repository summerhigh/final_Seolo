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
	public ArrayList<ViewDTO> list(int acNo, String type, int guNo, int dongNo, int stickerNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<ViewDTO> result = new ArrayList<ViewDTO>();
		String sql =  " SELECT AC_NO, TYPE, MARKNO, LISTNO, GUNAME, DONGNAME, TITLE"
				+ "      , DEPOSIT, WOLSE, JEONSE, MAEMAE, SEC, TP, HJ, CONVENIENCE_TOT, PET"
				+ " FROM VIEW_LIST"
				+ " WHERE AC_NO = ?"
				+ "   AND TYPE LIKE ?"
				+ "   AND GU_NO = ?"
				+ "   AND DONG_NO = ?"
				+ "   AND CSTICKER_NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, acNo);
		pstmt.setString(2, type);
		pstmt.setInt(3, guNo);
		pstmt.setInt(4, dongNo);
		pstmt.setInt(5, stickerNo);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ViewDTO dto = new ViewDTO();
			dto.setType(rs.getString("TYPE"));
			dto.setMarkNo(rs.getInt("MARKNO"));
			dto.setListNo(rs.getInt("LISTNO"));
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
	public ArrayList<ViewDTO> list(int acNo, String type, int guNo, int stickerNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<ViewDTO> result = new ArrayList<ViewDTO>();
		String sql =  " SELECT AC_NO, TYPE, MARKNO, LISTNO, GUNAME, DONGNAME, TITLE"
				+ "      , DEPOSIT, WOLSE, JEONSE, MAEMAE, SEC, TP, HJ, CONVENIENCE_TOT, PET"
				+ " FROM VIEW_LIST"
				+ " WHERE AC_NO = ?"
				+ "   AND TYPE LIKE ?"
				+ "   AND GU_NO = ?"
				+ "   AND CSTICKER_NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, acNo);
		pstmt.setString(2, type);
		pstmt.setInt(3, guNo);
		pstmt.setInt(4, stickerNo);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ViewDTO dto = new ViewDTO();
			dto.setType(rs.getString("TYPE"));
			dto.setMarkNo(rs.getInt("MARKNO"));
			dto.setListNo(rs.getInt("LISTNO"));
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
	public ArrayList<ViewDTO> list(int acNo, String type, int stickerNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<ViewDTO> result = new ArrayList<ViewDTO>();
		String sql =  " SELECT TYPE, MARKNO, LISTNO, GUNAME, DONGNAME, TITLE"
					+ "      , DEPOSIT, WOLSE, JEONSE, MAEMAE, SEC, TP, HJ, CONVENIENCE_TOT, PET"
					+ " FROM VIEW_LIST"
					+ " WHERE AC_NO = ?"
					+ "   AND TYPE LIKE ?"
					+ "   AND CSTICKER_NO = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, acNo);
		pstmt.setString(2, type);
		pstmt.setInt(3, stickerNo);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ViewDTO dto = new ViewDTO();
			dto.setType(rs.getString("TYPE"));
			dto.setMarkNo(rs.getInt("MARKNO"));
			dto.setListNo(rs.getInt("LISTNO"));
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
	public ArrayList<StickerDTO> mycheckStickerList(int no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<StickerDTO> result = new ArrayList<StickerDTO>();

		String sql = "SELECT CSTICKER_NO, CONTENT" 
					+ " FROM VIEW_MYCHECKSTICKER"
					+ " WHERE MARKNO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			StickerDTO dto = new StickerDTO();
			dto.setStickerNo(rs.getInt("CSTICKER_NO"));
			dto.setContent(rs.getString("CONTENT"));

			result.add(dto);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public ArrayList<StickerDTO> checkBookmarkStickerList(int no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<StickerDTO> result = new ArrayList<StickerDTO>();

		String sql = "SELECT CSTICKER_NO, CONTENT" 
					+ " FROM VIEW_CHECKSTICKER" 
					+ " WHERE MARKNO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			StickerDTO dto = new StickerDTO();
			dto.setStickerNo(rs.getInt("CSTICKER_NO"));
			dto.setContent(rs.getString("CONTENT"));

			result.add(dto);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public ArrayList<StickerDTO> localBookmarkStickerList(int no) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<StickerDTO> result = new ArrayList<StickerDTO>();

		String sql = "SELECT CSTICKER_NO, CONTENT" 
					+ " FROM VIEW_LOCALSTICKER"
					+ " WHERE MARKNO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			StickerDTO dto = new StickerDTO();
			dto.setStickerNo(rs.getInt("CSTICKER_NO"));
			dto.setContent(rs.getString("CONTENT"));

			result.add(dto);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}


	// 계정이 갖고 있는 스티커 정보
	@Override
	public ArrayList<StickerDTO> stickerList(int acNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<StickerDTO> result = new ArrayList<StickerDTO>();
		String sql = "SELECT S.CSTICKER_NO AS CSTICKER_NO, S.CONTENT AS CONTENT" 
				+ " FROM "
				+ " ("
				+ "     SELECT CSTICKER_NO" 
				+ "     FROM VIEW_ALLSTICKER" 
				+ "     WHERE AC_NO = ?"			// 값 입력①
				+ "     GROUP BY CSTICKER_NO"
				+ " ) T"
				+ " LEFT JOIN STICKER S"
				+ " ON T.CSTICKER_NO = S.CSTICKER_NO";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, acNo);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			StickerDTO dto = new StickerDTO();
			dto.setStickerNo(rs.getInt("CSTICKER_NO"));
			dto.setContent(rs.getString("CONTENT"));

			result.add(dto);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public ArrayList<GuDTO> guList() throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<GuDTO> result = new ArrayList<GuDTO>();

		String sql = "SELECT GU_NO, GUNAME"
					+ " FROM GU";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			GuDTO gu = new GuDTO();
			gu.setGuNo(rs.getInt("GU_NO"));
			gu.setGuName(rs.getString("GUNAME"));

			result.add(gu);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public ArrayList<DongDTO> dongList() throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<DongDTO> result = new ArrayList<DongDTO>();

		String sql = "SELECT DONG_NO, DONGNAME, GU_NO"
					+ " FROM DONG";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			DongDTO dong = new DongDTO();

			dong.setDongNo(rs.getInt("DONG_NO"));
			dong.setDongName(rs.getString("DONGNAME"));
			dong.setGuNo(rs.getInt("GU_NO"));

			result.add(dong);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public ArrayList<DongDTO> dongList(int guNo) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		ArrayList<DongDTO> result = new ArrayList<DongDTO>();

		String sql = "SELECT DONG_NO, DONGNAME, GU_NO"
					+ " FROM DONG" 
					+ " WHERE GU_NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, guNo);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			DongDTO dong = new DongDTO();

			dong.setGuNo(rs.getInt("DONG_NO"));
			dong.setDongName(rs.getString("DONGNAME"));
			dong.setGuNo(rs.getInt("GU_NO"));

			result.add(dong);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}
}
