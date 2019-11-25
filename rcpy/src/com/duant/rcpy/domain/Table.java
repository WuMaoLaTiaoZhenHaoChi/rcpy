package com.duant.rcpy.domain;

import org.springframework.stereotype.Component;

@Component
public class Table {

	private String property1;
	private String property2;
	private int subjectid;
	private String subjectname;
	private int semester;
	private int fraction;
	private int classhour;
	private int classhourweek;
	private String mode;
	
	public Table() {
		super();
	}
	
	public Table(String property1, String property2, int subjectid, String subjectname, int semester, int fraction,
			int classhour, int classhourweek, String mode) {
		super();
		this.property1 = property1;
		this.property2 = property2;
		this.subjectid = subjectid;
		this.subjectname = subjectname;
		this.semester = semester;
		this.fraction = fraction;
		this.classhour = classhour;
		this.classhourweek = classhourweek;
		this.mode = mode;
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
	public int getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getFraction() {
		return fraction;
	}
	public void setFraction(int fraction) {
		this.fraction = fraction;
	}
	public int getClasshour() {
		return classhour;
	}
	public void setClasshour(int classhour) {
		this.classhour = classhour;
	}
	public int getClasshourweek() {
		return classhourweek;
	}
	public void setClasshourweek(int classhourweek) {
		this.classhourweek = classhourweek;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	
	@Override
	public String toString() {
		return "Table [property1=" + property1 + ", property2=" + property2 + ", subjectid=" + subjectid
				+ ", subjectname=" + subjectname + ", semester=" + semester + ", fraction=" + fraction + ", classhour="
				+ classhour + ", classhourweek=" + classhourweek + ", mode=" + mode + "]";
	}
	
}
