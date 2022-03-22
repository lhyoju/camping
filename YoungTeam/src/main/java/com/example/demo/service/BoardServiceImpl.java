package com.example.demo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDAO;
import com.example.demo.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoardGo(BoardVO b) {
		this.boardDAO.insertBoardGo(b);
	}
	
	@Override
	public void insertBoardOf(BoardVO b) {
		this.boardDAO.insertBoardOf(b);
	}
	
	@Override
	public void insertBoardQa(BoardVO b) {
		this.boardDAO.insertBoardQa(b);
	}

	@Override
	public List<BoardVO> getBoardListGo(BoardVO b) {
		return this.boardDAO.getBoardListGo(b);
	}

	@Override
	public List<BoardVO> getBoardListOf(BoardVO b) {
		return this.boardDAO.getBoardListOf(b);
	}
	
	@Override
	public List<BoardVO> getBoardListQa(BoardVO b) {
		return this.boardDAO.getBoardListQa(b);
	}

	@Override
	public int getListCountGo(BoardVO b) {
		return this.boardDAO.getListCountGo(b);
	}

	@Override
	public int getListCountOf(BoardVO b) {
		return this.boardDAO.getListCountOf(b);
	}

	@Override
	public int getListCountQa(BoardVO b) {
		return this.boardDAO.getListCountQa(b);
	}

	@Override
	public void updateHit(int board_no) {
		this.boardDAO.updateHit(board_no);		
	}

	@Override
	public BoardVO getBoardCont(int board_no) {
		return this.boardDAO.getBoardCont(board_no);
	}

	@Override
	public void replyBoard(BoardVO rb) {
		this.boardDAO.updateLevel(rb);
		this.boardDAO.replyBo(rb);
	}

	@Override
	public void editBoard(BoardVO eb) {
		this.boardDAO.editBoard(eb);		
	}

	@Override
	public void delBoard(int board_no) {
		this.boardDAO.delBoard(board_no);		
	}
}