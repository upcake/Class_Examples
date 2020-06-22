package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardDetailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.getDetail(board_num);
		if(!id.equals(dto.getBoard_id())) {	//작성자와 로그인 id가 같을경우 조회수가 증가하지 않음
			dao.readCount(board_num);	//조회수 증가
		}
		dto = dao.getDetail(board_num);	//증가한 조회수를 가져옴
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/board_view.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
