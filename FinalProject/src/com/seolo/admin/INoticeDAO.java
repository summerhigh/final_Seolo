/*======================
   INoticeDAO.java
   - 인터페이스
=======================*/

package com.seolo.admin;

import java.util.ArrayList;

public interface INoticeDAO
{
	/*
	public ArrayList<Region> list() throws SQLException;
	
	public int add(Region region) throws SQLException;
	public int remove(String regionId) throws SQLException;
	public int modify(Region region) throws SQLException;
	*/
	
	public ArrayList<NoticeDTO> list();
	
	public int add(NoticeDTO n);
	public int modify(NoticeDTO n);
	public int remove(NoticeDTO n);
	
}
