package com.duant.rcpy.domain;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Infotosubject implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer infotosubjectid;
	private Integer fraction;
	private Integer classhour;
	private Integer classhourweek;
	private String mode;
	private Integer infoid;
	private Integer subjectid;
	private Integer semester;
	public Infotosubject() {
		super();
	}
	public Infotosubject(Integer infotosubjectid, Integer fraction, Integer classhour, Integer classhourweek,
			String mode, Integer infoid, Integer subjectid, Integer semester) {
		super();
		this.infotosubjectid = infotosubjectid;
		this.fraction = fraction;
		this.classhour = classhour;
		this.classhourweek = classhourweek;
		this.mode = mode;
		this.infoid = infoid;
		this.subjectid = subjectid;
		this.semester = semester;
	}
	public Integer getInfotosubjectid() {
		return infotosubjectid;
	}
	public void setInfotosubjectid(Integer infotosubjectid) {
		this.infotosubjectid = infotosubjectid;
	}
	public Integer getFraction() {
		return fraction;
	}
	public void setFraction(Integer fraction) {
		this.fraction = fraction;
	}
	public Integer getClasshour() {
		return classhour;
	}
	public void setClasshour(Integer classhour) {
		this.classhour = classhour;
	}
	public Integer getClasshourweek() {
		return classhourweek;
	}
	public void setClasshourweek(Integer classhourweek) {
		this.classhourweek = classhourweek;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public Integer getInfoid() {
		return infoid;
	}
	public void setInfoid(Integer infoid) {
		this.infoid = infoid;
	}
	public Integer getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(Integer subjectid) {
		this.subjectid = subjectid;
	}
	public Integer getSemester() {
		return semester;
	}
	public void setSemester(Integer semester) {
		this.semester = semester;
	}
	@Override
	public String toString() {
		return "Infotosubject [infotosubjectid=" + infotosubjectid + ", fraction=" + fraction + ", classhour="
				+ classhour + ", classhourweek=" + classhourweek + ", mode=" + mode + ", infoid=" + infoid
				+ ", subjectid=" + subjectid + ", semester=" + semester + "]";
	}	
	
}
