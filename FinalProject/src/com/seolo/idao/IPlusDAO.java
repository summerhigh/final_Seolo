package com.seolo.idao;

import java.util.ArrayList;

import com.seolo.dto.PlusDTO;
import com.seolo.dto.ScoreDTO;

public interface IPlusDAO
{
	// 입력, 코멘트 입력
	public int addTime(PlusDTO dto);	// 제목과 시간만 입력
	public int addTimeco(PlusDTO dto);	// 제목, 시간, 코멘트 다 입력
	public int addScore(PlusDTO dto);
	public int addScoreco(PlusDTO dto);
	
	// 수정, 코멘트 수정
	public int modifyTime(PlusDTO dto);
	public int modifyTimeco(PlusDTO dto);
	public int modifyScore(PlusDTO dto);
	public int modifyScoreco(PlusDTO dto);
	
	// 삭제
	public int removeTime(int plusNo);
	public int removeScore(int plusNo);
	
	/*
	// 고유번호로 추가항목 내용 찾기
	public PlusDTO searchTime(int plusNo);
	public PlusDTO searchScore(int plusNo);
	*/
	
	// 지금 계정번호에서 가장 최근에 쓴 체크리스트 고유번호 가져오기
	public int searchCheckNo(int acNo);
	
	// 지금 계정번호에서 가장 최근에 쓴 추가항목번호 가져오기
	public int searchPlusTimeNo(int acNo);
	public int searchPlusScoreNo(int acNo);
	
	// 시간추가항목 전체리스트 가져오기 - 고유번호가 큰 순 정렬
	public ArrayList<PlusDTO> timeList(int checkNo);
	
	// 점수추가항목 전체리스트 가져오기 - 고유번호가 큰 순 정렬
	public ArrayList<PlusDTO> scoreList(int checkNo);
	
	
	// 해당 추가고유번호의 추가항목 가져오기 - 수정 관련
	public PlusDTO plusTime(int plusTimeNo);
	public PlusDTO plusScore(int plusScoreNo);
	
	// 점수 목록 가져오기
	public ArrayList<ScoreDTO> scores();

}
