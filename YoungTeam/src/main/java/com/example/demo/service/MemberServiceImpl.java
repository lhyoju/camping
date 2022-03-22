package com.example.demo.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public MemberVO login(String userid) {
		return memberDao.login(userid);
	}

	@Override
	public void insertMember(MemberVO m) {
		memberDao.insertMember(m);
	}
	
	//비밀번호 찾기
	@Override
	public void pwdSearch(HttpServletResponse response, MemberVO m) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		MemberVO db_member = memberDao.pwdSearch(m);

		if(db_member == null) { 
			out.println("입력한 정보에 해당하는 회원이 없습니다.");
			out.close();
		}else {
			//임시 비밀번호 생성
			String newPwd = "";
			for (int i = 0; i < 12; i++) {
				newPwd += (char) ((Math.random() * 26) + 97);
			}

			//암호화한 임시 비밀번호 저장
			m.setUserpwd(passwordEncoder.encode(newPwd));
			memberDao.updatePwd(m);

			// 비밀번호 변경 메일 발송
			send_mail(m.getUserid(),newPwd,m.getEmail(),m.getEmail2());

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	//임시 비밀번호 이메일 발송
	@Override
	public void send_mail(String userid, String newPwd, String email, String email2) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //smtp 서버명
		String hostSMTPid = ""; //실제 네이버 아이디
		String hostSMTPpwd = ""; //실제 네이버 비번

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = ""; //네이버 아이디
		String fromName = "연곡 해변 캠핑장"; //메일 보내는 사람 이름
		String subject = ""; //메일 제목
		String msg = ""; //메일 내용


		subject = "[연곡 해변 캠핑장] 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana; padding: 30px 0;'>";
		msg += "<h3 style='color: #f68b1e;'>";
		msg += userid + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += newPwd + "</p></div>";

		//받는 사람 E-Mail 주소
		String mail = email+"@"+email2;
		//email 전송
		try {
			HtmlEmail sendMail = new HtmlEmail();
			sendMail.setDebug(true);
			sendMail.setCharset(charSet);
			sendMail.setSSL(true);
			sendMail.setHostName(hostSMTP);
			sendMail.setSmtpPort(587);

			sendMail.setAuthentication(hostSMTPid, hostSMTPpwd);
			sendMail.setTLS(true);
			sendMail.addTo(mail, charSet);
			sendMail.setFrom(fromEmail, fromName, charSet);
			sendMail.setSubject(subject);
			sendMail.setHtmlMsg(msg);
			sendMail.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public MemberVO idSearch(MemberVO m) {
		return memberDao.idSearch(m);
	}

	@Override
	public int idCheck(String userid) {
		return memberDao.idCheck(userid);
	}

	@Override
	public void editMember(MemberVO m) {
		memberDao.editMember(m);
	}

	@Override
	public void delMember(MemberVO m) {
		memberDao.delMember(m);

	}

	@Override
	public MemberVO joinEmailCheck(MemberVO m) {
		return memberDao.joinEmailCheck(m);
	}

}
