package com.example.demo.service;

import javax.servlet.http.HttpServletResponse;

import com.example.demo.vo.MemberVO;

public interface MemberService {

	public MemberVO login(String userid);

	public void insertMember(MemberVO m);
	
	public void pwdSearch(HttpServletResponse response,MemberVO m) throws Exception;
	
	public void send_mail(String userid, String userpwd, String email, String email2) throws Exception;

	public MemberVO idSearch(MemberVO m);

	public int idCheck(String userid);

	public void editMember(MemberVO m);

	public void delMember(MemberVO m);

	public MemberVO joinEmailCheck(MemberVO m);

}
