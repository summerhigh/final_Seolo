package com.seolo.check;

public class PlusDTO
{
	//○ PlusDTO 자료형 클래스
	//-- '나의 체크리스트' 게시글의 추가항목에 관한 작업(등록, 수정, 삭제...) 시 사용 
	
	// 주요 속성 구성
	private int pTime_no, pScore_no;
	private int check_no;
	private String title, comments, scoreName;
	private int time, scoreNo;
	
	// getter, setter 구성
	
	public int getpTime_no()
	{
		return pTime_no;
	}
	public int getCheck_no()
	{
		return check_no;
	}
	public void setCheck_no(int check_no)
	{
		this.check_no = check_no;
	}
	public void setpTime_no(int pTime_no)
	{
		this.pTime_no = pTime_no;
	}
	public int getpScore_no()
	{
		return pScore_no;
	}
	public void setpScore_no(int pScore_no)
	{
		this.pScore_no = pScore_no;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getComments()
	{
		return comments;
	}
	public void setComments(String comments)
	{
		this.comments = comments;
	}
	public String getScoreName()
	{
		return scoreName;
	}
	public void setScoreName(String scoreName)
	{
		this.scoreName = scoreName;
	}
	public int getTime()
	{
		return time;
	}
	public void setTime(int time)
	{
		this.time = time;
	}
	public int getScoreNo()
	{
		return scoreNo;
	}
	public void setScoreNo(int scoreNo)
	{
		this.scoreNo = scoreNo;
	}
	
	
}
