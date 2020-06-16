package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		
		ActionForward forward = new ActionForward();
		//id 세션이 안만들어진 비정상적인 접근의 경우 로그인 화면으로 돌려보낸다
		if(id == null) {
			forward.setPath("memberLogin.me");
			forward.setRedirect(true); //가져갈게 없으므로 sendRedirect
			return forward;
		}
		forward.setPath("board/board_list.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
