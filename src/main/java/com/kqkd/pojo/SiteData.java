package com.kqkd.pojo;

import java.util.Date;

public class SiteData {
    private Integer id;

    private Date date;

    private Integer dpv;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getDpv() {
        return dpv;
    }

    public void setDpv(Integer dpv) {
        this.dpv = dpv;
    }

    public SiteData() {
    }

    public SiteData(Date date, Integer dpv) {
        this.date = date;
        this.dpv = dpv;
    }
}