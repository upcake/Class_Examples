package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardModifyView implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		BoardDAO dao = new BoardDAO();
		boolean result = dao.isBoardWriter(board_num, id);	//작성자 확인
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result == false) {
			out.println("<script>alert('수정 권한이 없습니다!');");
			out.println("history.go(-1);</script>");
		} else {
			BoardDTO dto = dao.getDetail(board_num);
			request.setAttribute("dto", dto);
			
			ActionForward forward = new ActionForward();
			forward.setPath("board/board_modify.jsp");
			forward.setRedirect(false);
			return forward;
		}
		return null;
	}
}
