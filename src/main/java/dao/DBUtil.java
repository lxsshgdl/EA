package dao;

import java.sql.*;

public class DBUtil {

	static String url = "jdbc:mysql://localhost:3306/train?serverTimezone=GMT";
    static String user ="root";
    static String password ="123456";
	
	public static Connection getConnection(){
		Connection conn=null;
		 try{  Class.forName("com.mysql.cj.jdbc.Driver");//加载JDBC-MySQL驱动
	      }
	      catch(Exception e){}
		try {
			 conn=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeJDBC(Statement stmt,Connection conn)
	{
		closeJDBC(null,stmt,conn);
	}
	public static void closeJDBC(ResultSet rs,Statement stmt,Connection conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
