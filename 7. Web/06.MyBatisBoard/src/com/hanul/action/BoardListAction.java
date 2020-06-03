package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DAO 연동하여 게시판 테이블의 전체 목록을 가져오는 작업을 수행 : 비즈니스 로직
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardSearchAll();
		request.setAttribute("list", list);
		
		//BoardListAction 작업을 마무리 했다 → 프레젠테이션 로직(페이지 전환) : ActionForward.java
		//① View Page(path) : board/boardList.jsp
		//② 페이지 전환 방식(isRedirect) : forward()
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardList.jsp");
		forward.setRedirect(false); // true : sendRedirect() / false : forward()
		return forward;
	}
}