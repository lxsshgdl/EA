package servlet;

import dao.PeixunDao;
import entity.Peixun;
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
 * Servlet implementation class PxsaveServlet
 */
@WebServlet("/PxsaveServlet")
public class PxsaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PxsaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		List<User> user = (List) session.getAttribute("users");
		int id = Integer.parseInt(request.getParameter("id"));
		Peixun peixun = new Peixun();
		peixun.setId(id);
		peixun.setUsername(user.get(0).getUsername());
		peixun.setTitle(request.getParameter("title"));
		peixun.setContent(request.getParameter("content"));
		peixun.setFile(request.getParameter("file"));
		PeixunDao dao = new PeixunDao();
		boolean index = dao.update(peixun);
		if(index) {
			out.println("<script>");
			out.println("alert('修改成功！')");
			out.println("window.location='PxlistServlet'");
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
