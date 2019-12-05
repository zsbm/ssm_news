package news.service.news;

import java.util.List;

import news.dao.news.INewsDao;
import news.model.news.News;
import news.model.news.NewsDTO;
import news.model.news.NewsQueryObject;
import news.util.DbUtil;

public class NewsService {
	INewsDao newsDao = DbUtil.getSqlSession().getMapper(INewsDao.class);
	

	public int addNews(News news) {
		return newsDao.addNews(news);
	}
	public int verifyId(int id) {
		return newsDao.verifyId(id);
	}

	public List<NewsDTO> queryNewsList() {
		return newsDao.queryNewsList();
	}

	public int deleteNewsById(String id) {
		return newsDao.deleteNewsById(id);
	}

	public int queryTypeById(String id) {
		return newsDao.queryTypeById(id);
	}

	public int updateNews(News news) {
		return newsDao.updateNews(news);
	}

	public List<News> queryNewsByCondition(NewsQueryObject newsQueryObject) {
		return newsDao.queryNewsByCondition(newsQueryObject);
	}

	public NewsDTO queryNewsById(String id) {
		return newsDao.queryNewsById(id);
	}
	
}
