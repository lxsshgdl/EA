package dao;

import util.ConvertUtil;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

public class BaseDao {
    /**
     * 此方法只能用于查询
     *
     * @param sql ：查询sql语句
     * @param obj ：SQL语句给值
     * @param sun 请传入你要查询的对象
     * @return ：list: 在list里放的是泛型对象， ...obj:应用JDK1.5新特性，可以传1个值或数组方便使用
     */

    public <T> List<T> excuteQuery(String sql, Class<T> sun, Object... obj) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            if (obj != null && obj.length > 0) {
                for (int i = 0; i < obj.length; i++) {
                    ps.setObject(i + 1, obj[i]);
                }
            }
            rs = ps.executeQuery();
            ArrayList<T> list = new ArrayList<T>();
            if (rs != null) {
                ResultSetMetaData data = rs.getMetaData();

                while (rs.next()) {
                    // 创建泛型对象
                    Object o = Class.forName(sun.getName()).newInstance();

                    // 获得查询的数据库有多少列
                    int count = data.getColumnCount();
                    for (int i = 0; i < count; i++) {

                        // 获得列名
                        String columnName = data.getColumnName(i + 1);
                        // 获得列值
                        Object value = rs.getObject(i + 1);
                        if (value != null) {
                            // 生成要执行的方法,因为方法的的第二个单词大写所有需要转换大小写
                            String methodName = ConvertUtil.FieldToMethod(columnName);
                            //System.out.println(methodName);
                            // 利用反射机制，生成setXX()方法的Method对象并执行该setXX()方法。
                            Method method = o.getClass().getMethod(methodName, value.getClass());
                            method.invoke(o, value);
                        }

                    }
                    list.add((T) o);
                }
                return list;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeJDBC(rs, ps, conn);

        }
    }

    /**
     * 此方法只能执行增删改
     *
     * @param sql
     *            ：查询sql语句
     * @param obj
     *            ：SQL语句给值
     * @return 真假:
     */
    public boolean excuteUpdate(String sql, Object[] obj) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            System.out.println(obj.length);
            if (obj != null && obj.length > 0) {
                for (int i = 0; i < obj.length; i++) {

                    ps.setObject(i + 1, obj[i]);
                }
            }
            int a = ps.executeUpdate();
            if (a > 0) {
                return true;

            } else {
                return false;

            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {

            DBUtil.closeJDBC(ps, conn);
        }
    }

}
