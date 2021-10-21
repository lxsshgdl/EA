package servlet;

import dao.ShenbaoDao;
import entity.Shenbao;
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
 * Servlet implementation class ShenbaoServlet
 */
@WebServlet("/ShenbaoServlet")
public class ShenbaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShenbaoServlet() {
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
		HttpSession session = request.getSession();
		List<User> users = (List) session.getAttribute("users");
		String username = users.get(0).getUsername();
		PrintWriter out = response.getWriter();
		Shenbao shenbao = new Shenbao();
		shenbao.setUsername(username);
		shenbao.setPxcontent(request.getParameter("pxconent"));
		shenbao.setAddress(request.getParameter("address"));
		shenbao.setType(Integer.parseInt(request.getParameter("type")));
		shenbao.setFellowworkers(request.getParameter("fellowworkers"));
		shenbao.setReason(request.getParameter("reason"));
		String date = request.getParameter("begintime");
		java.sql.Date time1 = java.sql.Date.valueOf(date);
		shenbao.setBegintime(time1);
		date = request.getParameter("endtime");
		java.sql.Date time2 = java.sql.Date.valueOf(date);
		shenbao.setEndtime(time2);
		shenbao.setFile(request.getParameter("file"));
		shenbao.setFeiyong(Double.parseDouble(request.getParameter("feiyong")));
		ShenbaoDao dao = new ShenbaoDao();
		boolean index = dao.add(shenbao);
		if(index) {
			out.println("<script type ='text/javascript' charset = 'UTF-8'>");
			out.println("alert('申报成功！')");
			out.println("window.location='index.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script type ='text/javascript' charset = 'UTF-8'>");
			out.println("alert('申报失败！')");
			out.println("window.location='index.jsp'");
			out.println("</script>");
		}
	}

}
