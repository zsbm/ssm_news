package news.service.user;

import java.util.List;

import news.dao.user.IUserDao;
import news.model.user.User;
import news.model.user.UserQueryObject;
import news.page.news.PageResult;
import news.util.DbUtil;

public class UserPageQueryService {
	IUserDao userDao = DbUtil.getSqlSession().getMapper(IUserDao.class);

	public PageResult pageQuery(PageResult pageResult) {
		List<User> dataList=userDao.pageQuery((pageResult.getCurrentPage()-1)*pageResult.getPageSize(),pageResult.getPageSize());
		pageResult.setDataList(dataList);
		pageResult.setTotalCount(userDao.queryCounts());
		int totalCount = pageResult.getTotalCount();
		int pageSize = pageResult.getPageSize();
		pageResult.setTotalPage(totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1);
		System.out.println(pageResult);//
		return pageResult;
	}

	public PageResult queryUserByConditionByPageQuery(UserQueryObject userQueryObject, PageResult pageResult) {
		List<User> dataList=userDao.pageQueryByCondition((pageResult.getCurrentPage()-1)*pageResult.getPageSize(),pageResult.getPageSize(),userQueryObject);
		pageResult.setDataList(dataList);
		pageResult.setTotalCount(userDao.queryCountsByCondition(userQueryObject));
		int totalCount = pageResult.getTotalCount();
		int pageSize = pageResult.getPageSize();
		pageResult.setTotalPage(totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1);
		System.out.println(pageResult);//
		return pageResult;
	}
	
}
