package news.dao;

import org.apache.ibatis.annotations.Param;

import news.model.user.User;

public interface ILoginDao {

	User checkUser(@Param("account")String account, @Param("password")String password);
	
}
