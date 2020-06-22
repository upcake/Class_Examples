package com.board.action;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commons.action.Action;
import com.commons.action.ActionForward;

@WebServlet("/BoardFrontController.bo")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String command = uri.substring(context.length());
		//System.out.println(command);	//콘솔 창에 /memberLogin.me 등이 출력된다.
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/boardList.bo")) {
			action = new BoardListAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardWrite.bo")) {
			forward = new ActionForward();
			forward.setPath("board/board_write.jsp");
			forward.setRedirect(false);
			//가져갈게 있으면 true(forward) 없으면 false(sendRedirect)
			//URL 바뀌면 true(boardWrite.bo로 바뀌어서 안됨) 안바뀌면 false
		} else if(command.equals("/boardAddAction.bo")) {
			action = new BoardAddAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardDetailAction.bo")) {
			action = new BoardDetailAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardDeleteAction.bo")) {
			action = new BoardDeleteAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardModifyView.bo")) {
			action = new BoardModifyView();
			forward = action.execute(request, response);
		} else if(command.equals("/boardModifyAction.bo")) {
			action = new BoardModifyAction();
			forward = action.execute(request, response);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {	//true : sendRedirect() 전환
				response.sendRedirect(forward.getPath());
			} else {					//false : forward() 전환
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}
}