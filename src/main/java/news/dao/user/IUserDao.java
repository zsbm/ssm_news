package news.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import news.model.user.User;
import news.model.user.UserQueryObject;

public interface IUserDao {
	int verifyId(int id);
	int querynewsID(String id);
	int addUser(User user);
	List<User> pageQuery(@Param("startIndex")int startIndex, @Param("pageSize")int pageSize);
	int queryCounts();
	int deleteUserById(String id);
	int updateUser(User user);
	List<User> queryUserByCondition(UserQueryObject userQueryObject);
	List<User> pageQueryByCondition(@Param("startIndex")int startIndex, @Param("pageSize")int pageSize, @Param("userQueryObject")UserQueryObject userQueryObject);
	int queryCountsByCondition(UserQueryObject userQueryObject);
}
