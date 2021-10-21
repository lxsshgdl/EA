package entity;

import java.sql.*;

public class Shenbao {
    private Integer id;
    private String username;
    private String pxcontent;
    private String address;
    private Integer type;
    private String fellowworkers;
    private String reason;
    private Date begintime;
    private Date endtime;
    private String file;
    private Double feiyong;
    private Integer audit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFeiyong(Double feiyong) {
        this.feiyong = feiyong;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPxcontent() {
        return pxcontent;
    }

    public void setPxcontent(String pxcontent) {
        this.pxcontent = pxcontent;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getFellowworkers() {
        return fellowworkers;
    }

    public void setFellowworkers(String fellowworkers) {
        this.fellowworkers = fellowworkers;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public double getFeiyong() {
        return feiyong;
    }

    public void setFeiyong(double feiyong) {
        this.feiyong = feiyong;
    }

    public Integer getAudit() {
        return audit;
    }

    public void setAudit(Integer audit) {
        this.audit = audit;
    }
}
