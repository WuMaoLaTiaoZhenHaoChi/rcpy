package com.duant.rcpy.domain;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Page implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer currentPage;    //当前页数
    private Integer totalPages;       //总页数
    private Integer totalInfos;            //记录总行数
    private Integer pageSize=5;    //每页记录行数
    private Integer nextPage;        //下一页
    private Integer prefPage;       //前一页
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPages() {
		return totalPages = totalInfos % pageSize == 0 ? totalInfos / pageSize : totalInfos / pageSize + 1;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	public int getTotalInfos() {
		return totalInfos;
	}
	public void setTotalInfos(int totalInfos) {
		this.totalInfos = totalInfos;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getNextPage() {
		if(this.currentPage < this.getTotalPages() ) {
			nextPage = currentPage + 1;
		}else {
			nextPage = totalPages;
		}
		return nextPage;
	}
	
	public int getPrefPage() {
		if(this.currentPage > 1) {
			prefPage = currentPage - 1;
		}else {
			prefPage = 1;
		}
		return prefPage;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", totalPages=" + totalPages + ", totalInfos=" + totalInfos
				+ ", pageSize=" + pageSize + ", nextPage=" + nextPage + ", prefPage=" + prefPage + "]";
	}
    
    
}
