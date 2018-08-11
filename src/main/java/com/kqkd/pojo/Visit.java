package com.kqkd.pojo;

public class Visit {
    private Integer id;

    private String ip;

    private String address;

    private String visitInfo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getVisitInfo() {
        return visitInfo;
    }

    public void setVisitInfo(String visitInfo) {
        this.visitInfo = visitInfo == null ? null : visitInfo.trim();
    }
}