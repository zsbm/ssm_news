package news.page.news;

import java.util.List;

public class PageResult {
	private int currentPage;
	private int pageSize;
	private List<?> dataList;
	private int totalPage;
	private int totalCount;
	
	public PageResult() {
		super();
	}
	public PageResult(int currentPage, int pageSize, List<?> dataList, int totalPage, int totalCount) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.dataList = dataList;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<?> getDataList() {
		return dataList;
	}
	public void setDataList(List<?> dataList) {
		this.dataList = dataList;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "PageResult [currentPage=" + currentPage + ", pageSize=" + pageSize + ", dataList=" + dataList
				+ ", totalPage=" + totalPage + ", totalCount=" + totalCount + "]";
	}
}
