package com.duant.rcpy.service;

import org.springframework.stereotype.Service;

import com.duant.rcpy.domain.Tip;

public interface TipService {
	/**
	 * 处理提示信息
	 * @param tip
	 * @return
	 */
	public int replaceIntoTip(Tip tip) ;
	
	/**
	 * 查询Tip信息
	 * @param tipid
	 * @return
	 */
	public Tip selectTipByTipid(int tipid);
	
	public String selectMsg(int tipid);
	
}
