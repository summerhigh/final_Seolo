package com.seolo.dto;

public class PlusDTO
{
	//○ PlusDTO 자료형 클래스
	//-- '나의 체크리스트' 게시글의 추가항목에 관한 작업(등록, 수정, 삭제...) 시 사용 
	
	// 주요 속성 구성
	// 추가항목 고유번호, 체크고유번호, 계정번호, 제목, 코멘트, 시간, 점수
	private int checkNo, acNo, plusTimeNo, plusScoreNo;
	private String timeTitle, scoreTitle, timeComments, scoreComments, scoreNo, time;
	
	// getter / setter 구성
	public int getCheckNo()
	{
		return checkNo;
	}
	public void setCheckNo(int checkNo)
	{
		this.checkNo = checkNo;
	}
	public int getAcNo()
	{
		return acNo;
	}
	public void setAcNo(int acNo)
	{
		this.acNo = acNo;
	}
	public int getPlusTimeNo()
	{
		return plusTimeNo;
	}
	public void setPlusTimeNo(int plusTimeNo)
	{
		this.plusTimeNo = plusTimeNo;
	}
	public int getPlusScoreNo()
	{
		return plusScoreNo;
	}
	public void setPlusScoreNo(int plusScoreNo)
	{
		this.plusScoreNo = plusScoreNo;
	}
	public String getTimeTitle()
	{
		return timeTitle;
	}
	public void setTimeTitle(String timeTitle)
	{
		this.timeTitle = timeTitle;
	}
	public String getScoreTitle()
	{
		return scoreTitle;
	}
	public void setScoreTitle(String scoreTitle)
	{
		this.scoreTitle = scoreTitle;
	}
	public String getTimeComments()
	{
		return timeComments;
	}
	public void setTimeComments(String timeComments)
	{
		this.timeComments = timeComments;
	}
	public String getScoreComments()
	{
		return scoreComments;
	}
	public void setScoreComments(String scoreComments)
	{
		this.scoreComments = scoreComments;
	}
	public String getScoreNo()
	{
		return scoreNo;
	}
	public void setScoreNo(String scoreNo)
	{
		this.scoreNo = scoreNo;
	}
	public String getTime()
	{
		return time;
	}
	public void setTime(String time)
	{
		this.time = time;
	}
	
	
	
	
}
