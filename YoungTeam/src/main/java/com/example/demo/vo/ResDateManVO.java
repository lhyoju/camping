package com.example.demo.vo;

import lombok.Getter;
import lombok.Setter;

public class ResDateManVO {
	private String resDateManId;
	
	private String resDate;
	private String sitenum;
	private String userid;
	private String resid;
	private int rescount;
	private int resManList;
	private int resstatus;
	//페이징 쪽나누기 관련변수
    private int startrow;//시작행 번호
    private int endrow;//끝행 번호
    
    //검색기능
    private String find_name;//검색어
    private String find_field;//검색필드
    
    public String getResDateManId() {
		return resDateManId;
	}
	public void setResDateManId(String resDateManId) {
		this.resDateManId = resDateManId;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getSitenum() {
		return sitenum;
	}
	public void setSitenum(String sitenum) {
		this.sitenum = sitenum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getResid() {
		return resid;
	}
	public void setResid(String resid) {
		this.resid = resid;
	}
	public int getRescount() {
		return rescount;
	}
	public void setRescount(int rescount) {
		this.rescount = rescount;
	}
	public int getResManList() {
		return resManList;
	}
	public void setResManList(int resManList) {
		this.resManList = resManList;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public int getResstatus() {
		return resstatus;
	}
	public void setResstatus(int resstatus) {
		this.resstatus = resstatus;
	}
	
}
