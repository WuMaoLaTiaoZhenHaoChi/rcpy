package com.duant.rcpy.domain;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Subject implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer subjectid;
	private String property1;
	private String property2;
	private String subjectname;
	
	public Subject() {
		super();
	}
	
	public Subject(Integer subjectid, String property1, String property2, String subjectname) {
		super();
		this.subjectid = subjectid;
		this.property1 = property1;
		this.property2 = property2;
		this.subjectname = subjectname;
	}

	public Integer getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(Integer subjectid) {
		this.subjectid = subjectid;
	}
	public String getProperty1() {
		return property1;
	}
	public void setProperty1(String property1) {
		this.property1 = property1;
	}
	public String getProperty2() {
		return property2;
	}
	public void setProperty2(String property2) {
		this.property2 = property2;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	@Override
	public String toString() {
		return "Subject [subjectid=" + subjectid + ", property1=" + property1 + ", property2=" + property2
				+ ", subjectname=" + subjectname + "]";
	}	
	
}
