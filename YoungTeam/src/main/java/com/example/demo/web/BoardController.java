package com.example.demo.web;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVO;

@Controller 
public class BoardController {

	private BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	//공지사항 - 글쓰기
	@GetMapping("/board/news/{userid}") 
	public String board_write(@PathVariable String userid, HttpServletRequest request, Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		m.addAttribute("userid",userid);
		return	"board/board_write"; 
	}

	//공지사항 - 글쓰기 완료
	@PostMapping("/board/news/{userid}")
	public ModelAndView board_write_ok(@ModelAttribute BoardVO b) {
		this.boardService.insertBoardGo(b);
		return new ModelAndView("redirect:/board/news");
	}

	//공지사항 
	@RequestMapping("/board/news")
	public ModelAndView news_list(@ModelAttribute BoardVO b, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		//페이징
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
		listM.setViewName("board/board_list");
		return listM;
	}

	@RequestMapping("/board/cont")
	public String board_cont(
			@RequestParam("no") int board_no,
			@RequestParam("state") String state, 
			HttpServletRequest request, Model m,@ModelAttribute BoardVO b){
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
			return "board/board_cont";
		}else if(state.equals("edit")) {
			return "board/board_edit";
		}else if(state.equals("reply")) {
			return "board/board_reply";
		}else if(state.equals("delA")) {
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			this.boardService.delBoard(board_no);
			return "redirect:/board/news?page="+page;
		}else if(state.equals("delB")) {
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			this.boardService.delBoard(board_no);
			return "redirect:/board/often?page="+page;
		}else if(state.equals("delC")) {
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			this.boardService.delBoard(board_no);
			return "redirect:/board/qna?page="+page;
		}
		return null;
	}

	@RequestMapping("/board/edit")
	public String board_edit_ok(@ModelAttribute BoardVO eb, HttpServletRequest request) throws Exception{
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		this.boardService.editBoard(eb);
		return 
				"redirect:/board/cont?no="+eb.getBoard_no()+
				"&page="+page+"&state=cont";
	}

	@GetMapping("/board/often/{userid}") 
	public String often_write(@PathVariable String userid, HttpServletRequest request, Model m){
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		m.addAttribute("userid", userid);
		return	"board/often_write"; 
	}

	@PostMapping("/board/often/{userid}")
	public ModelAndView often_write_ok(@ModelAttribute BoardVO b) {
		this.boardService.insertBoardOf(b);
		return new ModelAndView("redirect:/board/often");
	}

	@RequestMapping("/board/often")
	public ModelAndView often_list(@ModelAttribute BoardVO b, HttpServletRequest request){
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
		listM.setViewName("board/often_list");
		return listM;
	}

	@GetMapping("/board/qna/{userid}") 
	public String qna_write(@PathVariable String userid, HttpServletRequest request, Model m){
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		m.addAttribute("userid",userid);
		return	"board/qna_write"; 
	}

	@PostMapping("/board/qna/{userid}")
	public ModelAndView qna_write_ok(@PathVariable String userid, @ModelAttribute BoardVO b) {
		this.boardService.insertBoardQa(b);
		return new ModelAndView("redirect:/board/qna");
	}

	@RequestMapping("/board/qna")
	public ModelAndView qna_list(@ModelAttribute BoardVO b, HttpServletRequest request) throws Exception {
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
		listM.setViewName("board/qna_list");
		return listM;
	}	
	
	@RequestMapping("/board/qna/reply")
	public String board_reply_ok(@ModelAttribute BoardVO rb, HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		this.boardService.replyBoard(rb);
		return "redirect:/board/qna?page="+page;
	}
}