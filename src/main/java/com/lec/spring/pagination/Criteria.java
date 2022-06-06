package com.lec.spring.pagination;

public class Criteria {
	private int page;
	private int perPageNum = 10;
	
	
	
	public Criteria() {
		this.page = 1;
	}
	
	public Criteria(int page) {
		if(page<1)
			this.page=1;
		else
			this.page=page;
	}
	
	
	public void setPage (int page) {
		if(page<1)
			this.page=1;
		else
			this.page=page;
	}
	
	public int getPage() {
		return this.page;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	@Override
	public String toString() {
		return "[cri(page="+page+", perPageNum="+perPageNum;
		
	}
}
