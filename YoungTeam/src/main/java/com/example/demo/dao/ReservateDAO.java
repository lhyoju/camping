package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVO;
import com.example.demo.vo.ResDateManVO;
import com.example.demo.vo.ReservationVO;

@Mapper
public interface ReservateDAO {
	public List<ReservationVO> reservateTest();
	public void insertTest(ReservationVO vo);
	public void deleteTest(String resId);
	
	public List<ReservationVO> resCon(String userid);
	public List<ResDateManVO> resDateManSel();
	public void resDatemanIns(ResDateManVO vo);
	
	public int adminListCount(ReservationVO r);
	public int resManListCount(ReservationVO r);
	public int getResManList(ReservationVO r);
	public List<ReservationVO> adminList(ReservationVO r);
	public List<ReservationVO> resManList(ReservationVO r);
	public void refund(String resid);
	public void resDel(String resid);
	public void resvdel(String resid);
	public List<MemberVO> resSelNP(String userid);
	public void confirmPay(String resid);
	public void confirmPay2(String resid);
}
