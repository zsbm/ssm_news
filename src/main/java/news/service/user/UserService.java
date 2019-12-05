package news.service.user;

import java.util.List;

import news.dao.user.IUserDao;
import news.model.user.User;
import news.model.user.UserQueryObject;
import news.util.DbUtil;

public class UserService {
	IUserDao userDao = DbUtil.getSqlSession().getMapper(IUserDao.class);

	public int verifyId(int id) {
		return userDao.verifyId(id);
	}

	public int querynewsID(String id) {
		return userDao.querynewsID(id);
	}
	
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	public int deleteUserById(String id) {
		return userDao.deleteUserById(id);
	}

	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	public List<User> queryUserByCondition(UserQueryObject userQueryObject) {
		return userDao.queryUserByCondition(userQueryObject);
	}

}
