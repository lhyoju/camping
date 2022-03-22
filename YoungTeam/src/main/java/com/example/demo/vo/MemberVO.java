package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUphone1() {
		return uphone1;
	}
	public void setUphone1(String uphone1) {
		this.uphone1 = uphone1;
	}
	public String getUphone2() {
		return uphone2;
	}
	public void setUphone2(String uphone2) {
		this.uphone2 = uphone2;
	}
	public String getUphone3() {
		return uphone3;
	}
	public void setUphone3(String uphone3) {
		this.uphone3 = uphone3;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getUstate() {
		return ustate;
	}
	public void setUstate(int ustate) {
		this.ustate = ustate;
	}
	public String getDelcont() {
		return delcont;
	}
	public void setDelcont(String delcont) {
		this.delcont = delcont;
	}
	public String getDeldate() {
		return deldate;
	}
	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}
	private String userpwd;
	private String name;
	private String uphone1;
	private String uphone2;
	private String uphone3;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private String email2;
	private String zipcode;
	private String address;
	private String address2;
	private int auth;
	private String joindate;
	private int ustate; //가입회원1, 탈퇴회원 2
	private String delcont; //탈퇴사유
	private String deldate; //탈퇴날짜
}
