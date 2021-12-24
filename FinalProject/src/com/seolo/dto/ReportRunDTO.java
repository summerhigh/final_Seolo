package com.seolo.dto;

public class ReportRunDTO
{
	// status_no	신고 상태
	// rpcheck_no	신고 고유번호
	
	String status_no, rpcheck_no;

	// getter / setter 구성
	public String getStatus_no()
	{
		return status_no;
	}

	public void setStatus_no(String status_no)
	{
		this.status_no = status_no;
	}

	public String getRpcheck_no()
	{
		return rpcheck_no;
	}

	public void setRpcheck_no(String rpcheck_no)
	{
		this.rpcheck_no = rpcheck_no;
	}
	
}

