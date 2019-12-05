package news.service.news;

import java.util.List;

import news.dao.news.INewsDao;
import news.model.news.News;
import news.model.news.NewsQueryObject;
import news.model.user.User;
import news.page.news.PageResult;
import news.util.DbUtil;

public class NewPageQueryService {
	INewsDao newsDao = DbUtil.getSqlSession().getMapper(INewsDao.class);
	public PageResult pageQuery(PageResult pageResult) {
		List<News> dataList=newsDao.pageQuery((pageResult.getCurrentPage()-1)*pageResult.getPageSize(),pageResult.getPageSize());
		pageResult.setDataList(dataList);
		pageResult.setTotalCount(newsDao.queryCounts());
		int totalCount = pageResult.getTotalCount();
		int pageSize = pageResult.getPageSize();
		pageResult.setTotalPage(totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1);
		System.out.println(pageResult);
		return pageResult;
	}
	public PageResult queryNewsByConditionByPageQuery(NewsQueryObject newsQueryObject, PageResult pageResult) {
		List<News> dataList=newsDao.pageQueryByCondition((pageResult.getCurrentPage()-1)*pageResult.getPageSize(),pageResult.getPageSize(),newsQueryObject);
		pageResult.setDataList(dataList);
		pageResult.setTotalCount(newsDao.queryCountsByCondition(newsQueryObject));
		int totalCount = pageResult.getTotalCount();
		int pageSize = pageResult.getPageSize();
		pageResult.setTotalPage(totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1);
		System.out.println(pageResult);
		return pageResult;
	}
	
}
