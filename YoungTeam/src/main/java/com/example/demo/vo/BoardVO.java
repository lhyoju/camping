package com.example.demo.vo;

public class BoardVO {
	
		private int board_no; //게시물 번호
		private String board_name; //작성자
		private String board_title; //제목
		private String board_pwd; //비번
		private String board_cont; //내용
		private int board_hit; //조회수
		private int board_ref; //원본글과 답변글을 묶어주는 그룹번호
		private int board_step; //원본글이면 0, 첫번째 답변글 1
		private int board_level; //답변글 정렬 순서
		private String board_date; //등록날짜
		private String board_type; //게시판 유형
		
		//페이징 쪽나누기 관련변수
	    private int startrow;//시작행 번호
	    private int endrow;//끝행 번호
	    
	    //검색기능
	    private String find_name;//검색어
	    private String find_field;//검색필드
	        
		public int getBoard_no() {
			return board_no;
		}
		public void setBoard_no(int board_no) {
			this.board_no = board_no;
		}
		public String getBoard_name() {
			return board_name;
		}
		public void setBoard_name(String board_name) {
			this.board_name = board_name;
		}
		public String getBoard_title() {
			return board_title;
		}
		public void setBoard_title(String board_title) {
			this.board_title = board_title;
		}
		public String getBoard_pwd() {
			return board_pwd;
		}
		public void setBoard_pwd(String board_pwd) {
			this.board_pwd = board_pwd;
		}
		public String getBoard_cont() {
			return board_cont;
		}
		public void setBoard_cont(String board_cont) {
			this.board_cont = board_cont;
		}
		public int getBoard_hit() {
			return board_hit;
		}
		public void setBoard_hit(int board_hit) {
			this.board_hit = board_hit;
		}
		public int getBoard_ref() {
			return board_ref;
		}
		public void setBoard_ref(int board_ref) {
			this.board_ref = board_ref;
		}
		public int getBoard_step() {
			return board_step;
		}
		public void setBoard_step(int board_step) {
			this.board_step = board_step;
		}
		public int getBoard_level() {
			return board_level;
		}
		public void setBoard_level(int board_level) {
			this.board_level = board_level;
		}
		public String getBoard_date() {
			return board_date;
		}
		public void setBoard_date(String board_date) {
			this.board_date = board_date.substring(0,10);
			//0이상 10미만 사이 년월일만 반환
		}
		public String getBoarad_type() {
			return board_type;
		}
		public void setBoard_type(String board_type) {
			this.board_type = board_type;
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
	}
