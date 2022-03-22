package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVO;

@Mapper
public interface MemberDAO {

	public MemberVO login(String userid);

	public void insertMember(MemberVO m);

	public MemberVO pwdSearch(MemberVO m);

	public MemberVO idSearch(MemberVO m);

	public int idCheck(String userid);

	public void editMember(MemberVO m);

	public void delMember(MemberVO m);

	public void updatePwd(MemberVO m);

	public MemberVO joinEmailCheck(MemberVO m);

}
