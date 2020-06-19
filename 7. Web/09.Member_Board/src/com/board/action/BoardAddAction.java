package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String saveFoleder = "boardupload";
//		String realFolder = request.getRealPath(saveFoleder);
		
		String realFolder = ""; //저장 경로
		realFolder = "D:\\Study_Web\\workspace\\09.Member_Board\\WebContent\\boardupload";
		int fileSize = 5 * 1024 * 1024; //5MB
		//fileSize = byte 단위로 들어간다
		
		MultipartRequest multi = null; //파일 업로드 처리
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy(); //중복 파일 명 방지
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", policy);
		
		BoardDTO dto = new BoardDTO(); //BoardBean, BoardVo 라고도 부른다.
		dto.setBoard_id(multi.getParameter("board_id"));
		dto.setBoard_subject(multi.getParameter("board_subject"));
		dto.setBoard_content(multi.getParameter("board_content"));
		dto.setBoard_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		//뭔지 모르니까 찍어본다 ▶ 파일 이름이 찍힘 (ex : apple1.png)
		//System.out.println(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		
		BoardDAO dao = new BoardDAO(); //BoardService 라고도 부른다
		int succ = dao.boardInsert(dto);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(succ > 0) {
			out.println("<script>alert('등록 성공');");
			out.println("location.href='boardList.bo';</script>");
		} else {
			out.println("<script>alert('등록 실패');");
			out.println("location.href='boardList.bo';</script>");
		}
		return null;
	}
}