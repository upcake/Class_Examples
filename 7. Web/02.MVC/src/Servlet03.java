import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.MemberDAO;
import com.hanul.study.MemberDTO;

@WebServlet("/s03.do")
public class Servlet03 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 받는다 : 폼의 매개 변수를 가져온다 ▶ HttpServletRequest
		request.setCharacterEncoding("utf-8");
		//방법 1 : 미리 만들어둔 DTO 클래스 이용
//		String irum = request.getParameter("irum");
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
//		int age = Integer.parseInt(request.getParameter("age"));
//		String addr = request.getParameter("addr");
//		String tel = request.getParameter("tel");
		
		//방법 2 : 매개 변수 가져오면서 DTO 생성
		MemberDTO dto = new MemberDTO();
		dto.setIrum(request.getParameter("irum"));
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setAddr(request.getParameter("addr"));
		dto.setTel(request.getParameter("tel"));
		
		//② 비즈니스 로직 : DataBase 연동(DTO, DAO)
//		MemberDTO dto = new MemberDTO(irum, id, pw, age, addr, tel);
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberInsert(dto);
		
		//③ 프레젠테이션 로직(결과를 응답) : *.html, *.jsp ▶ HttpServletResponse
		response.setContentType("text/html; charset=utf-8");	//MIME Type
		PrintWriter out = response.getWriter();
		if(succ > 0) {
			out.println("<script>alert('회원가입 성공!');</script>");
			out.println("<a href='MemberMain.html'>회원가입 화면</a>");
			out.println("<br />");
			out.println("<a href='s04.do'>회원 목록 보기</a>");
		} else {
			out.println("<script>alert('회원가입 실패!');</script>");
			out.println("<a href='MemberMain.html'>회원가입 화면</a>");
			out.println("<br />");
			out.println("<a href='s04.do'>회원 목록 보기</a>");
		} //if
	} //service()
} //class