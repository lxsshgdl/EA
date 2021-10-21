package dao;

import java.util.List;

import entity.Peixun;

public class PeixunDao extends BaseDao {
    public boolean add(Peixun peixun) {
        String sql = "insert into pxpeixun (username,title,content,file) value(?,?,?,?)";
        Object[] param = {peixun.getUsername(), peixun.getTitle(), peixun.getContent(), peixun.getFile()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<Peixun> findAll() {
        String sql = "select * from pxpeixun";
        List<Peixun> peixuns = excuteQuery(sql, Peixun.class);
        return peixuns;
    }

    public List<Peixun> findByum(String username) {
        String sql = "select * from pxpeixun where username=?";
        Object[] param = {username};
        List<Peixun> peixuns = excuteQuery(sql, Peixun.class, param);
        return peixuns;
    }

    public boolean peixundel(String id) {
        String sql = "DELETE from pxpeixun where id=?";
        Object[] param = {id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public Peixun findByid(int id) {
        String sql = "select * from pxpeixun where id=?";
        Object[] param = {id};
        List<Peixun> peixuns = excuteQuery(sql, Peixun.class, param);
        Peixun peixun = null;
        if (peixuns != null)
            peixun = peixuns.get(0);
        return peixun;
    }

    public boolean update(Peixun peixun) {
        String sql = "UPDATE pxpeixun SET title=?,content=?,file=? where id=?";
        Object[] param = {peixun.getTitle(), peixun.getContent(), peixun.getFile(), peixun.getId()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }
}
