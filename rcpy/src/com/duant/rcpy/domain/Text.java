package com.duant.rcpy.domain;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Text implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer textid;
	private String title;
	private String target;
	private String targettext;
	private String require;
	private String requiretext;
	private String feature;
	private String featuretext;
	private String xuezhi;
	private String xuezhitext;
	private String subject;
	private String subjecttext;
	private Integer infoid;
	
	public Text() {
		super();
	}

	public Text(Integer textid, String title, String target, String require, String feature, String xuezhi,
			String subject, Integer infoid) {
		super();
		this.textid = textid;
		this.title = title;
		this.target = target;
		this.require = require;
		this.feature = feature;
		this.xuezhi = xuezhi;
		this.subject = subject;
		this.infoid = infoid;
	}

	public Integer getTextid() {
		return textid;
	}

	public void setTextid(Integer textid) {
		this.textid = textid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getTargettext() {
		return targettext;
	}

	public void setTargettext(String targettext) {
		this.targettext = targettext;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public String getRequiretext() {
		return requiretext;
	}

	public void setRequiretext(String requiretext) {
		this.requiretext = requiretext;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	

	public String getFeaturetext() {
		return featuretext;
	}

	public void setFeaturetext(String featuretext) {
		this.featuretext = featuretext;
	}

	public String getXuezhi() {
		return xuezhi;
	}

	public void setXuezhi(String xuezhi) {
		this.xuezhi = xuezhi;
	}

	public String getXuezhitext() {
		return xuezhitext;
	}

	public void setXuezhitext(String xuezhitext) {
		this.xuezhitext = xuezhitext;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getSubjecttext() {
		return subjecttext;
	}

	public void setSubjecttext(String subjecttext) {
		this.subjecttext = subjecttext;
	}

	public Integer getInfoid() {
		return infoid;
	}

	public void setInfoid(Integer infoid) {
		this.infoid = infoid;
	}

	@Override
	public String toString() {
		return "Text [textid=" + textid + ", title=" + title + ", target=" + target + ", targettext=" + targettext
				+ ", require=" + require + ", requiretext=" + requiretext + ", feature=" + feature + ", featuretext="
				+ featuretext + ", xuezhi=" + xuezhi + ", xuezhitext=" + xuezhitext + ", subject=" + subject
				+ ", subjecttext=" + subjecttext + ", infoid=" + infoid + "]";
	}
	
}
