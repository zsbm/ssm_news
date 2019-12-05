package news.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.user.User;
import news.model.user.UserQueryObject;
import news.page.news.PageResult;
import news.service.user.UserPageQueryService;
import news.service.user.UserService;

@WebServlet("/user/queryAdvUser")
public class QueryAdvUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QueryAdvUserServlet in...");
		String id = request.getParameter("id");
		String account = request.getParameter("account");
		String username = request.getParameter("username");
		String auth = request.getParameter("auth");
		System.out.println(id+account+username+auth);//12340
		UserQueryObject userQueryObject = new UserQueryObject(id, account, username,auth);

		String currentPageString = request.getParameter("currentPage");
		String pageSizeString = request.getParameter("pageSize");
		PageResult pageResult = new PageResult();
		int currentPage = 1;
		int pageSize = 2;
		if (!("".equals(currentPageString))&&currentPageString!=null) {
			currentPage= Integer.parseInt(currentPageString);
		}
		if (!("".equals(pageSizeString))&&pageSizeString!=null) {
			pageSize=Integer.parseInt(pageSizeString);
		}
		pageResult.setCurrentPage(currentPage);
		pageResult.setPageSize(pageSize);
		pageResult=new UserPageQueryService().queryUserByConditionByPageQuery(userQueryObject,pageResult);
		System.out.println(pageResult);//
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("userQueryObject", userQueryObject);
//		List<User> userList = new UserService().queryUserByCondition(userQueryObject);
//		System.out.println(userList);//
//		request.setAttribute("userList", userList);
//		request.setAttribute("userQueryObject", userQueryObject);
		request.getRequestDispatcher("/user/userQuery.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
