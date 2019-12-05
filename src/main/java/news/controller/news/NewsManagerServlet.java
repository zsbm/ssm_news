package news.controller.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.news.NewsDTO;
import news.page.news.PageResult;
import news.service.news.NewPageQueryService;
import news.service.news.NewsService;

@WebServlet("/news/newsManager")
public class NewsManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NewsManagerServlet in...");
		//		List<NewsDTO> newsDTOList = new NewsService().queryNewsList();
//		System.out.println(newsDTOList);//
//		request.setAttribute("newsDTOList", newsDTOList);
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
		pageResult=new NewPageQueryService().pageQuery(pageResult);
		request.setAttribute("pageResult", pageResult);
		request.getRequestDispatcher("/news/newsManager.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
