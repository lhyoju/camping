package com.example.demo.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller
public class MemberController {
	
	private MemberService memberService;

	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberController(MemberService memberService, PasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	//로그인 폼
	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}

	//로그인
	@PostMapping("/member/login")
	public void loginOk(MemberVO m, HttpServletResponse response, HttpSession session) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		MemberVO db_user = memberService.login(m.getUserid());

		if(db_user == null) {
			out.println("<script>");
			out.println("alert('회원 정보가 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			String db_pwd = db_user.getUserpwd(); //DB에 저장된 비번
			String pwd = m.getUserpwd(); //로그인시 입력한 비번

			if(!passwordEncoder.matches(pwd, db_pwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				session.setAttribute("userid", m.getUserid());
				session.setAttribute("uname", db_user.getName());

				if(db_user.getAuth() == 2) { //관리자권한일 경우
					session.setAttribute("auth", "admin");
				}else if(db_user.getAuth() == 1) { //일반회원권한일 경우
					session.setAttribute("auth", "member");
				}

				out.println("<script>");
				out.println("opener.location.replace('/');");
				out.println("window.close();");
				out.println("</script>");
			}
		}
	}

	//로그아웃
	@RequestMapping(value="/member/logout")
	public void logout(HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		session.invalidate();//세션 만료

		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location='/';");
		out.println("</script>");
	}

	//아이디 찾기 폼
	@GetMapping("/member/idsearch")
	public String idsearch() {
		return "member/idsearch";
	}

	//아이디 찾기
	@PostMapping("/member/idsearch")
	public ModelAndView idsearch_ok(HttpServletResponse response,@RequestParam String name,@RequestParam String email) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int index = email.indexOf("@");

		MemberVO m = new MemberVO();

		m.setName(name);
		m.setEmail(email.substring(0, index)); //이메일 주소 저장
		m.setEmail2(email.substring(index+1)); //이메일 도메인 저장

		MemberVO db_pwd = memberService.idSearch(m); //이름과 이메일주소로 비밀번호 찾기 (가입회원 구분 1)

		if(db_pwd == null) { //입력한 이름, 이메일주소에 해당하는 회원정보가 없을 경우
			out.println("<script>");
			out.println("alert('입력한 정보에 해당하는 회원이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else { //입력한 아이디, 이름에 해당하는 회원정보가 있는 경우
			ModelAndView mv = new ModelAndView();
			mv.addObject("userid", db_pwd.getUserid());
			mv.setViewName("login/idsearch_ok");

			return mv;
		}

		return null;
	}

	//비밀번호 찾기 폼
	@GetMapping("/member/pwdsearch")
	public String pwdSearch() {
		return "member/pwdsearch";
	}

	//비밀번호 찾기
	@PostMapping("/member/pwdsearch")
	public void pwdSearch_ok(HttpServletResponse response,@RequestParam String userid,@RequestParam String email) throws Exception{
		int index = email.indexOf("@");

		MemberVO m = new MemberVO();

		m.setUserid(userid);
		m.setEmail(email.substring(0, index)); //이메일 주소 저장
		m.setEmail2(email.substring(index+1)); //이메일 도메인 저장

		memberService.pwdSearch(response, m);
	}

	//회원가입 - 약관동의 폼
	@RequestMapping("/member/join")
	public String join() {
		return "member/join";
	}

	//회원가입 - 정보입력 폼
	@GetMapping("/member/register")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String agree = "N";
		if(request.getParameter("agree") != null) {
			agree = request.getParameter("agree");
		}

		if(agree.equals("Y")) {//약관동의 완료시 agree=Y 값 부여
			String[] domain = {"직접입력","naver.com","hanmail.net","daum.net","nate.com","hotmail.com","gmail.com"};

			ModelAndView mv = new ModelAndView();
			mv.addObject("domain", domain);
			mv.setViewName("member/register"); 

			return mv;
		}else{
			out.println("<script>");
			out.println("alert('회원가입약관 및 개인정보처리방침에 동의하셔야 합니다.');");
			out.println("location='/member/join';");
			out.println("</script>");
		}

		return null;
	}

	//회원가입
	@PostMapping("/member/register")
	public String join_ok(HttpServletResponse response, MemberVO m) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		MemberVO db_user = memberService.joinEmailCheck(m);
		if(db_user!=null) { //DB에 해당 이름과 이메일이 일치하는 아이디가 있으면
			out.println("<script>");
			out.println("alert('입력하신 정보에 해당하는 아이디가 이미 존재합니다.');");
			out.println("location='/member/register';");
			out.println("</script>");
		}else {
			//비밀번호 암호화
			String encodedPassword = passwordEncoder.encode(m.getUserpwd());
			m.setUserpwd(encodedPassword);

			memberService.insertMember(m);//회원 저장
			return "redirect:/member/join_ok";
		}
		return null;
	}
	
	//회원가입 - 아이디 중복검색 폼
	@GetMapping("/member/idDupCheck")
	public String idCheckForm() {
		return "member/idDupCheck";
	}

	//회원가입 - 아이디 중복검색
	@ResponseBody
	@RequestMapping("/join_idcheck")
	public Map<Object, Object> member_idcheck(@RequestBody String userid) {

		int count = 0;

		Map<Object, Object> map = new HashMap<Object, Object>();

		count = memberService.idCheck(userid);
		map.put("cnt", count);

		return map;
	}

	//회원가입 완료
	@GetMapping("/member/join_ok")
	public String join_ok_page() {
		return "member/join_ok";
	}

	//회원 정보 수정 폼
	@GetMapping("/member/edit")
	public ModelAndView member_edit(HttpSession session, MemberVO m) {
		String userid = (String)session.getAttribute("userid");

		ModelAndView mv = new ModelAndView();

		//로그인 안 되있을 경우 메인페이지로
		if(userid == null) {
			mv.setViewName("redirect:/");
			return mv;
		}

		m = memberService.login(userid);

		String[] domain = {"직접입력","naver.com","hanmail.net","daum.net","nate.com","hotmail.com","gmail.com"};


		mv.addObject("m", m);
		mv.addObject("domain", domain);
		mv.setViewName("member/member_edit");

		return mv;
	}

	//회원 정보 수정
	@PostMapping("/member/edit")
	public String member_edit_ok(HttpServletResponse response, HttpSession session, @ModelAttribute MemberVO m) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String userid = (String)session.getAttribute("userid");

		if(userid == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='/';");
			out.println("</script>");
		}else {
			//비밀번호 암호화
			String encodedPassword = passwordEncoder.encode(m.getUserpwd());
			m.setUserpwd(encodedPassword);

			memberService.editMember(m);//정보 수정

			out.println("<script>");
			out.println("alert('회원 정보 수정 완료!');");
			out.println("location='/member/edit';");
			out.println("</script>");
		}
		return null;
	}

	//회원탈퇴 폼
	@GetMapping("/member/delete")
	public ModelAndView model_del(HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='/';");
			out.println("</script>");
		}else {
			MemberVO m = memberService.login(userid);//DB로 부터 아이디에 해당하는 회원 정보를 가져온다.

			ModelAndView dm = new ModelAndView();
			dm.addObject("m", m);
			dm.setViewName("member/member_del");//뷰페이지 경로 설정
			return dm;
		}

		return null;
	}

	//회원 탈퇴
	@PostMapping("/member/delete")
	public String member_del_ok(HttpServletResponse response, HttpSession session, String userpwd, String delcont) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String userid = (String)session.getAttribute("userid");

		if(userid == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='/';");
			out.println("</script>");
		}else {

			MemberVO db_user = memberService.login(userid);

			if(!passwordEncoder.matches(userpwd, db_user.getUserpwd())) {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
			}else {

				MemberVO m = new MemberVO();

				m.setUserid(userid); m.setDelcont(delcont); //탈퇴사유 저장

				memberService.delMember(m);//회원탈퇴
				//아이디를 기준으로 탈퇴사유,ustate=2,delcont,deldate 수정

				session.invalidate();//세션 만료 -> 로그아웃

				out.println("<script>");
				out.println("alert('계정이 탈퇴되었습니다.');");
				out.println("location='/';");
				out.println("</script>");
			}
		}
		return null;
	}

}
