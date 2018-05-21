package com.jbm.model1.vo;

public class PageVO {

	// 페이징 처리를 위한 시작, 끝 수
	private int start, end;
	
	public PageVO() {
		
	}
	
	public PageVO(int pageNo, int numPage) {
		// end, start 구해서 대입
		this.end = pageNo * numPage;
		this.start = end-(numPage-1);
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
