package servlet;

import dao.BaoxiaoDao;
import entity.Baoxiao;
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

@WebServlet("/BaoxiaosaveServlet")
public class BaoxiaosaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaoxiaosaveServlet() {
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
        //System.out.println(1);
        int id = Integer.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        Baoxiao baoxiao = new Baoxiao();
        baoxiao.setId(id);
        baoxiao.setFellowworkers(request.getParameter("fellowworkers"));
        baoxiao.setAddress(request.getParameter("address"));
        baoxiao.setFeiyong(Double.parseDouble(request.getParameter("feiyong")));
        BaoxiaoDao dao = new BaoxiaoDao();
        boolean index = dao.update(baoxiao);
        if (index) {
            out.println("<script>");
            out.println("alert('修改成功！')");
            out.println("window.location='BxlistServlet'");
            out.println("</script>");
        }
    }

}
