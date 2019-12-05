package news.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.service.user.UserService;


@WebServlet("/user/verifyId")
public class VerifyIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("VerifyIdServlet...");
		String id = request.getParameter("id");
		PrintWriter printWriter = response.getWriter();
		if (!"".equals(id)&&id!=null) {
			int count = new UserService().verifyId(Integer.parseInt(id));
			System.out.println(count);//
			printWriter.println(count);
		}else {
			printWriter.println(2);
		}
		printWriter.flush();
		printWriter.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
