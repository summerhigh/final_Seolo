package com.seolo.idao;

import java.util.List;

import com.seolo.dto.LocalDTO;
import com.seolo.dto.RegionDTO;

public interface IRegionDAO
{
	public List<RegionDTO> guList();
	
	public List<RegionDTO> dongList(String guNo);
	
	public List<LocalDTO> localList(String guNo);
	
	public List<RegionDTO> checkList(String dongNo);
}
