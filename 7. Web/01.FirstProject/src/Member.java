import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.MemberDTO;

@WebServlet("/member.do")
public class Member extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트의 요청을 받는다 : 매개 변수를 가져온다 ▶ HttpServletRequest
		request.setCharacterEncoding("utf-8");
		String irum = request.getParameter("irum");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		
		//비지니스 로직 : DAO를 통해 DB와 연동하여 결과를 리턴받는 작업
		MemberDTO dto = new MemberDTO(irum, id, pw, age, addr);
		
		//DB 연동 : MemberDAO.java → insertMember(dto) ▶ 생략
		
		//프리젠테이션 로직 : 리턴 받은 결과를 클라이언트에게 응답 ▶ HttpServletResponse
		request.setAttribute("dto", dto);
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		rd.forward(request, response);
	}
}