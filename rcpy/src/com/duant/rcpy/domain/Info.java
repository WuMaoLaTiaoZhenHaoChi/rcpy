package com.duant.rcpy.domain;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Info implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer infoid;
	private Integer grade;
	private String college;
	private String  specialty;
	private Integer change;
	private Integer submit;
	private Integer userid;
	
	public Info() {
		super();
	}
	
	public Info(Integer id, Integer infoid, Integer grade, String college, String specialty, Integer change,
			Integer submit, Integer userid) {
		super();
		this.id = id;
		this.infoid = infoid;
		this.grade = grade;
		this.college = college;
		this.specialty = specialty;
		this.change = change;
		this.submit = submit;
		this.userid = userid;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getInfoid() {
		return infoid;
	}
	public void setInfoid(Integer infoid) {
		this.infoid = infoid;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public Integer getChange() {
		return change;
	}

	public void setChange(Integer change) {
		this.change = change;
	}

	public Integer getSubmit() {
		return submit;
	}

	public void setSubmit(Integer submit) {
		this.submit = submit;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Info [id=" + id + ", infoid=" + infoid + ", grade=" + grade + ", college=" + college + ", specialty="
				+ specialty + ", change=" + change + ", submit=" + submit + ", userid=" + userid + "]";
	}
	
	
}
