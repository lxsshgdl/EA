package dao;

import java.util.List;

import entity.Shenbao;

public class ShenbaoDao extends BaseDao {
    public boolean add(Shenbao shenbao) {
        String sql = "insert into pxshenbao(username,pxcontent,address,type,fellowworkers,reason,begintime,endtime,file,feiyong) value(?,?,?,?,?,?,?,?,?,?)";
        Object[] param = {shenbao.getUsername(), shenbao.getPxcontent(), shenbao.getAddress(), shenbao.getType(), shenbao.getFellowworkers(), shenbao.getReason(), shenbao.getBegintime(), shenbao.getEndtime(), shenbao.getFile(), shenbao.getFeiyong()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<Shenbao> findByun(String username) {
        String sql = "select * from pxshenbao where username = ?";
        Object[] param = {username};
        List<Shenbao> shenbaos = excuteQuery(sql, Shenbao.class, param);
        return shenbaos;
    }

    public boolean shenbaodel(String id) {
        String sql = "DELETE from pxshenbao where id = ?";
        Object[] param = {id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public Shenbao findByid(int id) {
        String sql = "select * from pxshenbao where id = ?";
        Object[] param = {id};
        List<Shenbao> shenbaos = excuteQuery(sql, Shenbao.class, param);
        Shenbao shenbao = null;
        if (shenbaos != null)
            shenbao = shenbaos.get(0);
        return shenbao;
    }

    public boolean update(Shenbao shenbao) {
        String sql = "UPDATE pxshenbao SET username=?,pxcontent=?,address=?,type=?,fellowworkers=?,reason=?,begintime=?,endtime=?,file=?,feiyong=?  WHERE id =?";
        Object[] param = {shenbao.getUsername(), shenbao.getPxcontent(), shenbao.getAddress(), shenbao.getType(), shenbao.getFellowworkers(), shenbao.getReason(), shenbao.getBegintime(), shenbao.getEndtime(), shenbao.getFile(), shenbao.getFeiyong(), shenbao.getId()};
        boolean result = excuteUpdate(sql, param);
        return result;
    }

    public List<Shenbao> findAll() {
        String sql = "select * from pxshenbao";
        List<Shenbao> shenbaos = excuteQuery(sql, Shenbao.class);
        return shenbaos;
    }

    public boolean SH(String audit, String id) {
        String sql = "UPDATE pxshenbao SET audit=? where id=?";
        Object[] param = {audit, id};
        boolean result = excuteUpdate(sql, param);
        return result;
    }
}
