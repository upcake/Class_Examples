import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.MemberDAO;
import com.hanul.study.MemberDTO;

@WebServlet("/s04.do")
public class Servlet04 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//비즈니스 로직 : 전체 회원 목록을 검색하는 메서드 호출 ▶ memberSearchAll()
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.memberSearchAll();
		
		//프레젠테이션 로직 : list의 값을 출력 → *.html, *.jsp
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("[전체 회원 목록 보기]");
		out.println("<br />");
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<th>이름</th>");
		out.println("<th>아이디</th>");
		out.println("<th>비밀번호</th>");
		out.println("<th>나이</th>");
		out.println("<th>주소</th>");
		out.println("<th>전화번호</th>");
		out.println("</tr>");
		for (MemberDTO dto : list) {
			out.println("<tr align='center'>");
			out.println("<td>" + dto.getIrum() + "</td>");
			out.println("<td>" + dto.getId() + "</td>");
			out.println("<td>" + dto.getPw() + "</td>");
			out.println("<td>" + dto.getAge() + "</td>");
			out.println("<td>" + dto.getAddr() + "</td>");
			out.println("<td>" + dto.getTel() + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("<br />");
		out.println("<a href='MemberMain.html'>회원가입 화면</a>");
	}
}