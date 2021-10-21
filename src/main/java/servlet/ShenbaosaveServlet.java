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
 * Servlet implementation class ShenbaosaveServlet
 */
@WebServlet("/ShenbaosaveServlet")
public class ShenbaosaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShenbaosaveServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		Shenbao shenbao = new Shenbao();
		shenbao.setId(id);
		shenbao.setUsername(username);
		shenbao.setPxcontent(request.getParameter("pxcontent"));
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
		boolean ok = dao.update(shenbao);
		if(ok) {
			out.println("<script>");
			out.println("alert('修改成功！')");
			out.println("window.location='SblistServlet'");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('修改成功！')");
			out.println("window.location='SblistServlet'");
			out.println("</script>");
		}
		
	}

}
