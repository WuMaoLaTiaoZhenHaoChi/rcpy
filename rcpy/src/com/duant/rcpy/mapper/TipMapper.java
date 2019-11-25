package com.duant.rcpy.mapper;

import com.duant.rcpy.domain.Tip;

public interface TipMapper {

	public int replaceIntoTip(Tip tip) ;
	
	public Tip selectTipByTipid(int tipid);
	
}
