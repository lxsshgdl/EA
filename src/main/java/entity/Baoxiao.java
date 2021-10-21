package entity;

public class Baoxiao {
    private Integer id;
    private String username;
    private String fellowworkers;
    private String address;
    private String summary;
    private Double feiyong;
    private Integer audit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFellowworkers() {
        return fellowworkers;
    }

    public void setFellowworkers(String fellowworkers) {
        this.fellowworkers = fellowworkers;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Double getFeiyong() {
        return feiyong;
    }

    public void setFeiyong(Double feiyong) {
        this.feiyong = feiyong;
    }

    public Integer getAudit() {
        return audit;
    }

    public void setAudit(Integer audit) {
        this.audit = audit;
    }
}
