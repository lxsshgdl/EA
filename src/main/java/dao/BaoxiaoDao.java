package dao;

import entity.Baoxiao;

import java.util.List;

public class BaoxiaoDao extends BaseDao {
    public boolean add(Baoxiao baoxiao) {
        String sql = "insert into pxbaoxiao(username,fellowworkers,address,summary,feiyong) values(?,?,?,?,?)";
        Object[] param = {baoxiao.getUsername(), baoxiao.getFellowworkers(), baoxiao.getAddress(), baoxiao.getSummary(), baoxiao.getFeiyong()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<Baoxiao> findByun(String username) {
        String sql = "select * from pxbaoxiao where username = ?";
        Object[] param = {username};
        List<Baoxiao> baoxiaos = excuteQuery(sql, Baoxiao.class, param);
        return baoxiaos;
    }

    public boolean baoxiaodel(String id) {
        String sql = "DELETE from pxbaoxiao where id = ?";
        Object[] param = {id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public Baoxiao findByid(int id) {
        String sql = "select * from pxbaoxiao where id = ?";
        Object[] param = {id};
        List<Baoxiao> baoxiaos = excuteQuery(sql, Baoxiao.class, param);
        Baoxiao baoxiao = null;
        if (baoxiaos != null)
            baoxiao = baoxiaos.get(0);
        return baoxiao;
    }

    public boolean update(Baoxiao baoxiao) {
        String sql = "UPDATE pxbaoxiao SET fellowworkers=?,address=?,feiyong=?where id=?";
        Object[] param = {baoxiao.getFellowworkers(), baoxiao.getAddress(), baoxiao.getFeiyong(), baoxiao.getId()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<Baoxiao> findAll() {
        String sql = "select *from pxbaoxiao";
        List<Baoxiao> baoxiaos = excuteQuery(sql, Baoxiao.class);
        return baoxiaos;
    }

    public boolean SH(String audit, String id) {
        String sql = "UPDATE pxbaoxiao SET audit = ? where id = ?";
        Object[] param = {audit, id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }
}
