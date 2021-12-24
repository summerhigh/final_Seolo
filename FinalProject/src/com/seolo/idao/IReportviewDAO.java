package com.seolo.idao;

import java.util.ArrayList;

import com.seolo.dto.ReportRunDTO;
import com.seolo.dto.ReportviewDTO;

public interface IReportviewDAO
{
	// 신고 게시판 조회
	public ArrayList<ReportviewDTO> list();
	
	// 신고 게시글 조회
	public ReportviewDTO view(int num);

}
