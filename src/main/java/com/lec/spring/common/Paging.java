package com.lec.spring.common;

import lombok.Data;

@Data
public class Paging {
	private int displayPageNum = 10;
	private int totalCount;
	private int totalPage;

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private Criteria cri;
	


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		pagingData();
	}

	private void pagingData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tmpEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}

		totalPage = (totalCount%10==0) ? totalCount/10 : (totalCount/10)+1; 
		
		prev = !(startPage == 1);
		next = !(endPage * cri.getPerPageNum() >= totalCount);
		
		
		
		if(cri.getPage()<1) {
			cri.setPage(1);
		}
		if(cri.getPage()>totalPage) {
			cri.setPage(endPage);
		}

	}

}
