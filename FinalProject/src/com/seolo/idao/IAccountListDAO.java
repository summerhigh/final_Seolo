/*=========================
   IAccountListDAO.java
   - 회원 출력 인터페이스
==========================*/

package com.seolo.idao;
import java.util.ArrayList;
import com.seolo.dto.AccountListDTO;
import com.seolo.dto.WithdrawalAccountListDTO;


public interface IAccountListDAO
{
	// 게시물 목록
	public ArrayList<AccountListDTO> list();
	public int count();
}
