package com.example.demo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertBoardGo(BoardVO b) {
      this.sqlSession.insert("board_in_go",b);
	}
	
	@Override
	public void insertBoardOf(BoardVO b) {
		this.sqlSession.insert("board_in_of",b);
	}
	
	@Override
	public void insertBoardQa(BoardVO b) {
		this.sqlSession.insert("board_in_qa",b);
	}

	@Override
	public List<BoardVO> getBoardListGo(BoardVO b) {
		return this.sqlSession.selectList("board_li_go",b);
	}
	
	@Override
	public List<BoardVO> getBoardListOf(BoardVO b) {
		return this.sqlSession.selectList("board_li_of",b);
	}
	
	@Override
	public List<BoardVO> getBoardListQa(BoardVO b) {
		return this.sqlSession.selectList("board_li_qa",b);
	}

	@Override
	public int getListCountGo(BoardVO b) {
		return this.sqlSession.selectOne("board_row_go",b);
	}

	@Override
	public int getListCountOf(BoardVO b) {
		return this.sqlSession.selectOne("board_row_of",b);
	}

	@Override
	public int getListCountQa(BoardVO b) {
		return this.sqlSession.selectOne("board_row_qa",b);
	}
	
	@Override
	public void updateHit(int board_no) {
		this.sqlSession.update("board_hi",board_no);
	}

	@Override
	public BoardVO getBoardCont(int board_no) {
		return this.sqlSession.selectOne("board_co",board_no);
	}

	@Override
	public void updateLevel(BoardVO rb) {
		this.sqlSession.update("reply_up",rb);		
	}

	@Override
	public void replyBo(BoardVO rb) {
		this.sqlSession.insert("reply_in",rb);		
	}

	@Override
	public void editBoard(BoardVO eb) {
		this.sqlSession.update("board_up", eb);		
	}

	@Override
	public void delBoard(int board_no) {
		this.sqlSession.delete("board_del",board_no);
	}
}



