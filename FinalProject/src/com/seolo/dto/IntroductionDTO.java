package com.seolo.dto;

public class IntroductionDTO
{
	private int in_no;
	private String ad_id, content;
	
	// 덮어쓰기
	// getter / setter 구성
	public int getIn_no()
	{
		return in_no;
	}
	public void setIn_no(int in_no)
	{
		this.in_no = in_no;
	}
	public String getAd_id()
	{
		return ad_id;
	}
	public void setAd_id(String ad_id)
	{
		this.ad_id = ad_id;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	
	
	

}
