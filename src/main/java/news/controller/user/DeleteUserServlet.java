package news.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.service.user.UserService;

@WebServlet("/user/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int rows2=new UserService().querynewsID(id);
		if(rows2==1) {
			int z=0;
			PrintWriter printWriter = response.getWriter();
			printWriter.println(z);//�������2������ɾ��
			printWriter.flush();
			printWriter.close();

		}else {
			int rows = new UserService().deleteUserById(id);
			PrintWriter printWriter = response.getWriter();
			printWriter.println(rows);
			printWriter.flush();
			printWriter.close();
		}
		
		


		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
