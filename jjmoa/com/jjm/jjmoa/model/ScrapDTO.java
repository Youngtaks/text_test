package com.jjm.jjmoa.model;

public class ScrapDTO {
    private int scrap_idx; 
    private int publish_idx; 
    private int member_idx;
    private String regdate; 

    public int getScrap_idx() {
        return scrap_idx;
    }

    public void setScrap_idx(int scrap_idx) {
        this.scrap_idx = scrap_idx;
    }

    public int getPublish_idx() {
        return publish_idx;
    }

    public void setPublish_idx(int publish_idx) {
        this.publish_idx = publish_idx;
    }

    public int getMember_idx() {
        return member_idx;
    }

    public void setMember_idx(int member_idx) {
        this.member_idx = member_idx;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
}
