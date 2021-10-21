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
 * Servlet implementation class RegistServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistServlet() {
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
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		int usertype = Integer.parseInt(request.getParameter("usertype"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setUsertype(usertype);
		user.setEmail(request.getParameter("email"));
		user.setJobtitle(request.getParameter("jobtitle"));
		java.sql.Date date_joined = new java.sql.Date(System.currentTimeMillis());
		user.setDate_joined(date_joined);
		user.setLogintimes(0);
		user.setIs_active(1);
		if(usertype == 2||usertype == 3) {
			user.setShenhe(0);
		}
		else{
			user.setShenhe(1);
		}
		UserDao dao = new UserDao();
		boolean ok = false;
		ok = dao.add(user);
		if (ok)
		{
			out.println("<script type ='text/javascript'>");
			out.println("alert('注册成功,请返回登录')");
			out.println("window.location='login.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script type ='text/javascript'>");
			out.println("alert('注册失败,请返回注册')");
			out.println("window.location='registeration.jsp'");
			out.println("</script>");
		}
	}

}
