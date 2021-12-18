package com.seolo.check;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IPlusDAO
{
	//○ '추가항목'에 관한 작업(등록, 수정, 삭제...) 시 사용
	public int add(PlusDTO dto) throws SQLException;
	public int modify(PlusDTO dto) throws SQLException;
	public int remove(String type, int plusNo) throws SQLException;
	
	public PlusDTO searchId(String type, int plusNo) throws SQLException;
	public ArrayList<PlusDTO> plusList(int checkNo) throws SQLException;
	
}
