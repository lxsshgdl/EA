package dao;

import java.util.List;

import entity.User;

public class UserDao extends BaseDao {
    public List<User> Login(User user) {
        String sql = "SELECT * FROM auth_user WHERE username=? and password=?";
        List<User> users = excuteQuery(sql, User.class, user.getUsername(), user.getPassword());
        return users;
    }

    public boolean add(User user) {
        String sql = "insert into auth_user(username,password,date_joined,usertype,email,jobtitle,logintimes,is_active,shenhe) values(?,?,?,?,?,?,?,?,?)";
        Object[] param = {user.getUsername(), user.getPassword(), user.getDate_joined(), user.getUsertype(), user.getEmail(), user.getJobtitle(), user.getLogintimes(), user.getIs_active(), user.getShenhe()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<User> findAll() {
        String sqlstr = "SELECT *  FROM auth_user ";
        List<User> Users = excuteQuery(sqlstr, User.class);
        return Users;
    }

    public List<User> findShuser() {
        String sql = "select * from auth_user where shenhe = 0";
        List<User> users = excuteQuery(sql, User.class);
        return users;
    }

    public boolean usersh(String id) {
        String sql = "UPDATE auth_user SET shenhe = 1 where id = ?";
        Object[] param = {id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public boolean logintimes_add(String username) {
        String sql = "UPDATE auth_user SET logintimes = logintimes+1 where username = ?";
        Object[] param = {username};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<User> find_logintimes(String username) {
        String sql = "select logintimes from auth_user where username = ?";
        Object[] param = {username};
        List<User> users = excuteQuery(sql, User.class, param);
        return users;
    }

    public boolean not_active(String username) {
        String sql = "UPDATE auth_user SET is_active = 0 where username = ?";
        Object[] param = {username};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public boolean relogintimes(String username, java.sql.Timestamp time) {
        String sql = "UPDATE auth_user SET logintimes = 0, last_login = ? where username = ?";
        Object[] param = {time, username};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<User> decide_active(String username) {
        String sql = "select id from auth_user where username = ? and is_active=0";
        Object[] param = {username};
        List<User> users = excuteQuery(sql, User.class, param);
        return users;
    }

    public boolean repw(User user, String npassword) {
        String sql = "UPDATE auth_user SET password = ? where username = ?and password = ?";
        Object[] param = {npassword, user.getUsername(), user.getPassword()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public boolean userjs(String id) {
        String sql = "UPDATE auth_user SET is_active = 1 , logintimes = 0 where id = ?";
        Object[] param = {id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public boolean userdel(String id) {
        String sql = "DELETE from auth_user where id = ?";
        Object[] param = {id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public User getById(int id) {
        String sqlstr = "SELECT *  FROM auth_user WHERE id=?";
        List<User> users = excuteQuery(sqlstr, User.class, id);
        User user = null;
        if (users != null)
            user = users.get(0);
        return user;
    }

    public boolean update(User user) {
        String sqlstr = "UPDATE auth_user SET username=?,password=?,email=?,usertype=?,jobtitle=?  WHERE id =?";
        Object[] param = {user.getUsername(), user.getPassword(), user.getEmail(), user.getUsertype(), user.getJobtitle(), user.getId()};
        boolean result = excuteUpdate(sqlstr, param);
        return result;
    }
}
