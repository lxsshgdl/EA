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
 * Servlet implementation class UseraddServlet
 */
@WebServlet("/UseraddServlet")
public class UseraddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UseraddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setUsertype(Integer.parseInt(request.getParameter("usertype")));
		user.setEmail(request.getParameter("email"));
		user.setJobtitle(request.getParameter("jobtitle"));
		java.sql.Date date_joined = new java.sql.Date(System.currentTimeMillis());
		user.setDate_joined(date_joined);
		user.setLogintimes(0);
		user.setIs_active(1);
		user.setShenhe(0);
		UserDao dao = new UserDao();
		boolean ok = false;
		ok = dao.add(user);
		if(ok) {
			out.println("<script type ='text/javascript'>");
			out.println("alert('新增用户成功!')");
			out.println("window.location='userlistServlet'");
			out.println("</script>");
		}
	}

}
