package com.seolo.idao;

import com.seolo.personal.PersonalDTO;

public interface IUpdateDAO
{
	public PersonalDTO searchId(String pe_Id);	// 마이페이지 정보
	public int update(PersonalDTO dto);			// 회원정보 수정
	
	public int confirmPwd(PersonalDTO dto);   
	public int updatePwd(PersonalDTO dto);  
}
