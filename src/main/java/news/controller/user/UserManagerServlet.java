package news.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.page.news.PageResult;
import news.service.user.UserPageQueryService;

@WebServlet("/user/userManager")
public class UserManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserManagerServlet in...");

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
		pageResult=new UserPageQueryService().pageQuery(pageResult);
		request.setAttribute("pageResult", pageResult);
		request.getRequestDispatcher("/user/userManager.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
