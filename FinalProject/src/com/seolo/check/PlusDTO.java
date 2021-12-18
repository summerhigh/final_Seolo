package com.seolo.check;

public class PlusDTO
{
	//○ PlusDTO 자료형 클래스
	//-- '나의 체크리스트' 게시글의 추가항목에 관한 작업(등록, 수정, 삭제...) 시 사용 
	
	// 주요 속성 구성
	private String type; 		//-- 분류: 점수, 시간
	private int no;				//-- PK
	private String title, comments, scoreName;
	private int time, scoreNo;
	
	// getter, setter 구성
	public String getScoreName()
	{
		return scoreName;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public void setScoreName(String scoreName)
	{
		this.scoreName = scoreName;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no)
	{
		this.no = no;
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
