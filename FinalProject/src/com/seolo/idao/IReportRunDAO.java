package com.seolo.idao;

import java.util.ArrayList;

import com.seolo.dto.ReportRunDTO;
import com.seolo.dto.ReportviewDTO;
import com.seolo.personal.PersonalDTO;

public interface IReportRunDAO
{
	// 신고 승인 처리
	public int approval(ReportRunDTO dto);
	
	// 신고 반려 처리
	public int reject(ReportRunDTO dto);
	
	// 허위신고 처리
	public int fake(ReportRunDTO dto);
}
