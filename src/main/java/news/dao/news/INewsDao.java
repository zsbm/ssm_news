package news.dao.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import news.model.news.News;
import news.model.news.NewsDTO;
import news.model.news.NewsQueryObject;

public interface INewsDao {
	int addNews(News news);
	int verifyId(int id);
	List<NewsDTO> queryNewsList();
	int deleteNewsById(String id);
	int queryTypeById(String id);
	int updateNews(News news);
	int queryCounts();
	List<News> pageQuery(@Param("startIndex")int startIndex, @Param("pageSize")int pageSize);
	List<News> queryNewsByCondition(NewsQueryObject newsQueryObject);
	List<News> pageQueryByCondition(@Param("startIndex")int startIndex, @Param("pageSize")int pageSize, @Param("newsQueryObject")NewsQueryObject newsQueryObject);
	int queryCountsByCondition(NewsQueryObject newsQueryObject);
	NewsDTO queryNewsById(String id);
}
