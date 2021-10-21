package servlet;

import dao.UserDao;
import entity.User;
import jakarta.servlet.RequestDispatcher;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());


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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        java.sql.Timestamp time = new java.sql.Timestamp(System.currentTimeMillis());
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        UserDao dao = new UserDao();
        List<User> ok = dao.Login(user);                                //调用dao类判断账号密码是否正确
        if (ok != null && ok.size() != 0) {                            //返回值不为空 以及长度不为零是，说明验证账号密码成功
            int shenhe = ok.get(0).getShenhe();                    //获取放回值中存储是否被管理员审核的值 shenhe
            List<User> active = dao.decide_active(username);    //获取返回之中存储用户是否被锁定的值
            if (active != null && active.size() != 0) {                //判断用户是否被锁定
                out.println("<script>");
                out.println("alert('用户已经被锁定，请联系管理员解除锁定')");
                out.println("window.location='login.jsp'");
                out.println("</script>");
            } else if (shenhe != 0) {                                //判断领导和秘书用户身份是否被管理员审核
                dao.relogintimes(username, time);
                HttpSession session = request.getSession();
                session.setAttribute("users", ok);            //保持会话
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("PxlistServlet");
                requestDispatcher.forward(request, response);
            } else {
                out.println("<script>");
                out.println("alert('您的身份未经管理员审核，不可登录')");
                out.println("window.location='login.jsp'");
                out.println("</script>");
            }
        } else {
            List<User> active = dao.decide_active(username);
            if (active != null && active.size() != 0) {
                out.println("<script>");
                out.println("alert('用户已经被锁定，请联系管理员解除锁定')");
                out.println("window.location='login.jsp'");
                out.println("</script>");
            } else {
                boolean index = dao.logintimes_add(username);        //登录失败，增加数据库中登录失败的次数
                if (index) {
                    List<User> lists = dao.find_logintimes(username);        //查找数据库中的登录失败的次数
                    User ls = lists.get(0);
                    int logintimes = ls.getLogintimes();
                    if (logintimes == 3) {
                        dao.not_active(username);                        //若登录失败的次数达到3次  更改为锁定状态
                    }
                }
                out.println("<script type='text/avascript'>");
                out.println("alert('用户名或密码错误，请重新登陆')");
                out.println("window.location='login.jsp'");
                out.println("</script>");
            }
        }

    }
}
