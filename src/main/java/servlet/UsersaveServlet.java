package servlet;

import dao.UserDao;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class UsersaveServlet
 */
@WebServlet("/UsersaveServlet")
public class UsersaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("id")));
		int usertype = Integer.parseInt(request.getParameter("usertype"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setUsertype(usertype);
		user.setEmail(request.getParameter("email"));
		user.setJobtitle(request.getParameter("jobtitle"));
		UserDao dao = new UserDao();
		boolean ok = dao.update(user);
		if(ok) {
			out.println("<script type ='text/javascript'>");
			out.println("alert('修改成功')");
			out.println("window.location='userlistServlet'");
			out.println("</script>");
		}
		else {
			out.println("<script type ='text/javascript'>");
			out.println("alert('修改失败')");
			out.println("window.location='userlistServlet'");
			out.println("</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
