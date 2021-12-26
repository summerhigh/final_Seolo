package com.seolo.idao;

import java.util.ArrayList;

import com.seolo.dto.BookmarkDTO;
import com.seolo.dto.ChecklistDTO;
import com.seolo.dto.LocalDTO;
import com.seolo.dto.PlusDTO;
import com.seolo.dto.ScoreDTO;

public interface IReadDAO
{
	public ChecklistDTO read(int checkNo);
	
	public ArrayList<ScoreDTO> scoreList();

	public BookmarkDTO isBookMark(BookmarkDTO dto);
	
	public BookmarkDTO isLocalBookMark(BookmarkDTO dto);
	
	public ArrayList<PlusDTO> listTime(int checkNo);
	
	public ArrayList<PlusDTO> listScore(int checkNo);
	
	public ArrayList<String> listBookmarkSticker(int chbNo);
	
	public ArrayList<String> listWriterSticker(int checkNo);
	
	public LocalDTO readLocal(String dongNo);
	
	public ArrayList<String> listLocalBookmarkSticker(int lobNo);
}
