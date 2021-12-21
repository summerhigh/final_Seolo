package com.seolo.dto;

public class MainDTO
{
	// 공지사항 요소
	private int num, no_no;
	private String title, nodate;
	
	// 체크리스트 요소
	private int rank, check_no;
	private String guName, dongName, dongNo;
	
	public int getRank()
	{
		return rank;
	}
	public void setRank(int rank)
	{
		this.rank = rank;
	}
	public int getCheck_no()
	{
		return check_no;
	}
	public void setCheck_no(int check_no)
	{
		this.check_no = check_no;
	}
	public String getGuName()
	{
		return guName;
	}
	public void setGuName(String guName)
	{
		this.guName = guName;
	}
	public String getDongName()
	{
		return dongName;
	}
	public void setDongName(String dongName)
	{
		this.dongName = dongName;
	}
	public String getDongNo()
	{
		return dongNo;
	}
	public void setDongNo(String dongNo)
	{
		this.dongNo = dongNo;
	}
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public int getNo_no()
	{
		return no_no;
	}
	public void setNo_no(int no_no)
	{
		this.no_no = no_no;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getNodate()
	{
		return nodate;
	}
	public void setNodate(String nodate)
	{
		this.nodate = nodate;
	}
	
}
