package com.duant.rcpy.domain;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Tip implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int tipid;
	private String msg;
	private int infoid;
	private int userid;
	public int getTipid() {
		return tipid;
	}
	public void setTipid(int tipid) {
		this.tipid = tipid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getInfoid() {
		return infoid;
	}
	public void setInfoid(int infoid) {
		this.infoid = infoid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}

}
