package com.seolo.idao;

import java.util.ArrayList;

import com.seolo.dto.MainDTO;

public interface IMainDAO
{
	public ArrayList<MainDTO> noticeList();
	
	public ArrayList<MainDTO> localList();
	
	public ArrayList<MainDTO> checkList();
}
