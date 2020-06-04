package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardUpdateFormAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트 요청
		String b_num = request.getParameter("b_num");
		
		//비즈니스 로직
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.boardDetail(b_num);
		request.setAttribute("dto", dto);
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardUpdateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
