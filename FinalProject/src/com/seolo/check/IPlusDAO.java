package com.seolo.check;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IPlusDAO
{
	//○ '추가항목'에 관한 작업(등록, 수정, 삭제...) 시 사용
	
	public int addTime(PlusDTO dto) throws SQLException;
	public int addScore(PlusDTO dto) throws SQLException;
	public int modifyTime(PlusDTO dto) throws SQLException;
	public int modifyScore(PlusDTO dto) throws SQLException;
	public int removeTime(int plusNo) throws SQLException;
	public int removeScore(int plusNo) throws SQLException;
	
	public PlusDTO searchTimeId(int plusNo) throws SQLException;
	public PlusDTO searchScoreId(int plusNo) throws SQLException;
	public ArrayList<PlusDTO> plusTimeList(int checkNo) throws SQLException;
	public ArrayList<PlusDTO> plusScoreList(int checkNo) throws SQLException;
	
}
