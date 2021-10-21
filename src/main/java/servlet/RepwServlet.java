package servlet;

import dao.UserDao;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Servlet implementation class RepwServlet
 */
@WebServlet("/RepwServlet")
public class RepwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepwServlet() {
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
		HttpSession session = request.getSession();
		List<User> users = (List) session.getAttribute("users");
		String username = users.get(0).getUsername();
		User user = new User();
		user.setUsername(username);
		user.setPassword(request.getParameter("password"));
		String npassword = request.getParameter("npassword");
		System.out.println(username+npassword);
		UserDao dao = new UserDao();
		boolean index = dao.repw(user,npassword);
		if(index) {
			out.println("<script type ='text/javascript'>");
			out.println("alert('密码修改成功！请返回重新登录')");
			out.println("window.location='exitServlet'");
			out.println("</script>");
		}
		else {
			out.println("<script type ='text/javascript'>");
			out.println("alert('当前密码错误')");
			out.println("window.location='index.jsp'");
			out.println("</script>");
		}
		
	}

}
