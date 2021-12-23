package com.seolo.idao;

import com.seolo.dto.PlusDTO;

public interface IPlusDAO
{
	// 입력, 코멘트 입력
	public int addTime(PlusDTO dto);
	// public int addTimeco(PlusDTO dto);	어차피 코멘트 수정하는건 아래 코멘트수정메소드랑 같네
	public int addScore(PlusDTO dto);
	// public int addScoreco(PlusDTO dto);
	
	// 수정, 코멘트 수정
	public int modifyTime(PlusDTO dto);
	public int modifyTimeco(PlusDTO dto);
	public int modifyScore(PlusDTO dto);
	public int modifyScoreco(PlusDTO dto);
	
	// 삭제
	public int removeTime(int plusNo);
	public int removeScore(int plusNo);
	
	// 고유번호로 추가항목 내용 찾기
	public PlusDTO searchTime(int plusNo);
	public PlusDTO searchScore(int plusNo);
	
	// 지금 계정번호에서 가장 최근에 쓴 체크리스트 고유번호 가져오기
	public int searchCheckNo(int acNo);
	
	// 지금 계정번호에서 가장 최근에 쓴 추가항목번호 가져오기
	public int searchPlusTimeNo(int acNo);
	public int searchPlusScoreNo(int acNo);
}
