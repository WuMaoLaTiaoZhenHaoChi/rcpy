package com.duant.rcpy.service.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duant.rcpy.domain.Tip;
import com.duant.rcpy.mapper.TipMapper;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.TipService;

@Service
public class TipServiceImpl implements TipService{

	@Resource
	private TipMapper tipMapper;
	
	@Resource
	private InfoService infoService;
	
	@Override
	@Transactional
	public int replaceIntoTip(Tip tip) {
		int res1;
		res1 = tipMapper.replaceIntoTip(tip);
		//res2 = infoService.updateSubmitByInfoid(tip.getInfoid());
		if(res1 == 1 ) {
			return 1;
		}else{
			throw new RuntimeException("失败！");
		}
		
	}
	
	@Override
	public String selectMsg(int tipid) {
		String msg = null;
		Tip tip = tipMapper.selectTipByTipid(tipid);
		if(tip == null || tip.getMsg() == "null") {
			msg = "isnull";
		}else 
			msg = tip.getMsg();
		return msg;
	}

	@Override
	public Tip selectTipByTipid(int tipid) {
		return tipMapper.selectTipByTipid(tipid);
	}
		
}
