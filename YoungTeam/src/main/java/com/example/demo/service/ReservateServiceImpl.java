package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.ReservateDAO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.ResDateManVO;
import com.example.demo.vo.ReservationVO;

@Service("reservateTest")
public class ReservateServiceImpl implements ReservateService {
	
	
	
	@Autowired
	private ReservateDAO reservateDAO;
	
	@Override
	@Transactional
	public List<ReservationVO> reservateTest() {

		return reservateDAO.reservateTest();
	}
	
	@Override
	public void insertTest(ReservationVO vo) {
		reservateDAO.insertTest(vo);
	}
	
	@Override
	public void deleteTest(String resId) {
		reservateDAO.deleteTest(resId);
	}
	
	@Override
	public List<ReservationVO> resCon(String userid){
		return reservateDAO.resCon(userid);
	}
	
	@Override
	public List<ResDateManVO> resDateManSel(){
		return reservateDAO.resDateManSel();
	}
	public void resDatemanIns(ResDateManVO vo) {
		reservateDAO.resDatemanIns(vo);
	}

	@Override
	public int adminListCount(ReservationVO r) {
		return reservateDAO.adminListCount(r);
	}

	@Override
	public List<ReservationVO> adminList(ReservationVO r) {
		return reservateDAO.adminList(r);
	}
	
	@Override
	public int resManListCount(ReservationVO r) {
		return reservateDAO.resManListCount(r);
	}
	
	@Override
	public List<ReservationVO> resManList(ReservationVO r){
		return reservateDAO.resManList(r);
	}
	
	@Override
	public int getResManList(ReservationVO r) {
		return reservateDAO.getResManList(r);
	}
	@Override
	public void refund(String resid) {
		 reservateDAO.refund(resid);
	}
	
	@Override
	public void resDel(String resid) {
		reservateDAO.resDel(resid);
	}
	
	@Override
	public void resvdel(String resid) {
		reservateDAO.resvdel(resid);
	}

	@Override
	public List<MemberVO> resSelNP(String userid){
		return reservateDAO.resSelNP(userid);
	}
	@Override
	public void confirmPay(String resid) {
		reservateDAO.confirmPay(resid);
	}
	@Override
	public void confirmPay2(String resid) {
		reservateDAO.confirmPay2(resid);
	}
}
