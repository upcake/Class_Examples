package com.board.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		BoardDAO dao = new BoardDAO();
		int listCount = dao.getListCount();	//글의 총 개수
		System.out.println("listCount : " + listCount);
		
		int page = 1;	//시작 페이지 번호
		int limit = 10;	//한 페이지에 표시되는 페이지 개수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<BoardDTO> list = new ArrayList<>();
		list = dao.getBoardList(page, limit);	//전체 글 목록
		
		int maxPage = (int) ((float)listCount / 10 + 0.95);	//최대 페이지수
	
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 11, 21 ~~)
		int startPage = (((int)((float) page / 10 + 0.9)) - 1) * 10 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 ~~)
		int endPage = maxPage;
		if(endPage > startPage + 10 - 1) {
			endPage = startPage + 10 - 1;
		}
		
		request.setAttribute("page", page); 			//현재 페이지 수
		request.setAttribute("maxPage", maxPage);		//최대 페이지 수
		request.setAttribute("startPage", startPage);	//현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("endPage", endPage);		//현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listCount", listCount);	//글의 개수
		request.setAttribute("list", list);				//전체 글 목록
		
		
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
