package com.seolo.idao;

import com.seolo.personal.PersonalDTO;

public interface IUpdateDAO
{
	public PersonalDTO searchId(String pe_Id);
	public int update(PersonalDTO dto);
}
