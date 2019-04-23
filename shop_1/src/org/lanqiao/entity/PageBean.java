package org.lanqiao.entity;

import java.util.List;

public class PageBean<T> {
	private int currentPage;   //当前页
	private int currentCount;  //当前页的显示的数量
	private int totalCount;  //商品的总件数
	private int totalPage;  //总共的页数
	private List<T> list;   //将当前页的物品封装到集合中
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
