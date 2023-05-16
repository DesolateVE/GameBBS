package com.ve.po;

public class PageModel {

	private int pageNow; // 当前页数
	private int pageSize = 8; // 每页显示记录的条数
	private int totalCount; // 总的记录条数
	private int totalPageCount; // 总的页数
	@SuppressWarnings("unused")
	private int startPos;// 数据库开始位置，从0开始

	public PageModel(int pageNow, int totalCount) {
		super();
		this.pageNow = pageNow;
		this.totalCount = totalCount;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		totalPageCount = getTotalCount() / getPageSize();
		return (totalCount % pageSize == 0) ? totalPageCount // 总页数
				: totalPageCount + 1;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPos() {
		return (pageNow - 1) * pageSize;
	}

	public void setStartPos(int startPos) {
		this.startPos = startPos;
	}

}
