package news.service.login;

import news.dao.ILoginDao;
import news.model.user.User;
import news.util.DbUtil;

public class LoginService {

	public User checkUser(String account, String password) {
		ILoginDao loginDao = DbUtil.getSqlSession().getMapper(ILoginDao.class);
		User user = loginDao.checkUser(account,password);
		return user;
	}
	
}
