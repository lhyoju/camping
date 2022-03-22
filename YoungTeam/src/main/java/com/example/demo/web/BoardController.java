package com.example.demo.web;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.BoardService;
import com.example.demo.service.MemberService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.MemberVO;

@Controller 
public class BoardController {


	@Inject
	private BoardService boardService;
	
	@RequestMapping("/board_write") 
	public String board_write(HttpServletRequest request, HttpServletResponse response, Model m) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String uname=(String)session.getAttribute("uname");
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		return	"/board/board_write"; 
	}
	
	@RequestMapping(value="/board_write_ok",method=RequestMethod.POST)
	public ModelAndView board_write_ok(@ModelAttribute BoardVO b) {
		this.boardService.insertBoardGo(b);
		return new ModelAndView("redirect:/board_list");
	}
	
	@RequestMapping("/board_list")
	public ModelAndView board_list(@ModelAttribute BoardVO b, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String auth=(String)session.getAttribute("auth");
		
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");
		String find_field=request.getParameter("find_field");
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%");
       
        int listcount=this.boardService.getListCountGo(b);
		
		b.setStartrow((page-1)*10+1);
		b.setEndrow(b.getStartrow()+limit-1);
		
			List<BoardVO> blist=this.boardService.getBoardListGo(b);
		
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView listM=new ModelAndView();
		listM.addObject("blist",blist);
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
        listM.addObject("listcount",listcount);	
        listM.addObject("find_field",find_field);
        listM.addObject("find_name", find_name);
        listM.setViewName("/board/board_list");
		return listM;
	}

	@RequestMapping("/board_cont")
	public String board_cont(
		@RequestParam("no") int board_no,
		@RequestParam("state") String state, HttpServletResponse response, 
		HttpServletRequest request, Model m,@ModelAttribute BoardVO b) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String auth=(String)session.getAttribute("auth");
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			
			if(state.equals("cont")) {
			 this.boardService.updateHit(board_no);
			}
			b=this.boardService.getBoardCont(board_no);
			String board_cont=b.getBoard_cont().replace("\n", 
					"<br/>");
			
			m.addAttribute("b",b);
			m.addAttribute("bcont",board_cont);
			m.addAttribute("page",page);
			m.addAttribute("type",b.getBoarad_type());
			
			if(state.equals("cont")) {
				return "/board/board_cont";
			}else if(state.equals("edit")) {
				return "/board/board_edit";
			}else if(state.equals("reply")) {
				return "/board/board_reply";
			}else if(state.equals("delA")) {
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				this.boardService.delBoard(board_no);
				return "redirect:/board_list?page="+page;
			}else if(state.equals("delB")) {
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				this.boardService.delBoard(board_no);
				return "redirect:/often_list?page="+page;
			}else if(state.equals("delC")) {
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				this.boardService.delBoard(board_no);
				return "redirect:/qna_list?page="+page;
			}
			return null;
		}

	@RequestMapping("/board_edit_ok")
	public String board_edit_ok(@ModelAttribute BoardVO eb,
		HttpServletResponse response, HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
		
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			this.boardService.editBoard(eb);
			return 
			 "redirect:/board_cont?no="+eb.getBoard_no()+
			 "&page="+page+"&state=cont";
	}
	
	@RequestMapping("/often_write") 
	public String often_write(HttpServletRequest request, HttpServletResponse response, Model m) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String uname=(String)session.getAttribute("uname");
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		return	"/board/often_write"; 
	}
	
	@RequestMapping(value="/often_write_ok",method=RequestMethod.POST)
	public ModelAndView often_write_ok(@ModelAttribute BoardVO b) {
		this.boardService.insertBoardOf(b);
		return new ModelAndView("redirect:/often_list");
	}
		
	@RequestMapping("/often_list")
	public ModelAndView often_list(@ModelAttribute BoardVO b, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String auth=(String)session.getAttribute("auth");
		
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");
		String find_field=request.getParameter("find_field");
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%");
       
        int listcount=this.boardService.getListCountOf(b);
		
		b.setStartrow((page-1)*10+1);
		b.setEndrow(b.getStartrow()+limit-1);
		
			List<BoardVO> blist=this.boardService.getBoardListOf(b);
		
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView listM=new ModelAndView();
		listM.addObject("blist",blist);
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
        listM.addObject("listcount",listcount);	
        listM.addObject("find_field",find_field);
        listM.addObject("find_name", find_name);
        listM.setViewName("/board/often_list");
		return listM;
	}
	
	@RequestMapping("/qna_write") 
	public String qna_write(HttpServletRequest request, HttpServletResponse response, Model m) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String uname=(String)session.getAttribute("uname");
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		return	"/board/qna_write"; 
	}
	
	@RequestMapping(value="/qna_write_ok",method=RequestMethod.POST)
	public ModelAndView qna_write_ok(@ModelAttribute BoardVO b) {
		this.boardService.insertBoardQa(b);
		return new ModelAndView("redirect:/qna_list");
	}
		
	@RequestMapping("/qna_list")
	public ModelAndView qna_list(@ModelAttribute BoardVO b, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");
		String find_field=request.getParameter("find_field");
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%");
       
        int listcount=this.boardService.getListCountQa(b);
		
		b.setStartrow((page-1)*10+1);
		b.setEndrow(b.getStartrow()+limit-1);
		
			List<BoardVO> blist=this.boardService.getBoardListQa(b);
		
		int maxpage=(int)((double)listcount/limit+0.95);
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView listM=new ModelAndView();
		listM.addObject("blist",blist);
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
        listM.addObject("listcount",listcount);	
        listM.addObject("find_field",find_field);
        listM.addObject("find_name", find_name);
        listM.setViewName("/board/qna_list");
		return listM;
	}	
	@RequestMapping("/board_reply_ok")
		public String board_reply_ok(@ModelAttribute BoardVO rb, HttpServletRequest request, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		this.boardService.replyBoard(rb);//
	return "redirect:/qna_list?page="+page;
	}
}