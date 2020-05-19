import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;

@WebServlet("/gals.do")
public class GetAllListServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비즈니스 로직
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.getAllList();
		
		//프레젠테이션 로직
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		//CSS
		out.println("<style type=\"text/css\">");
			out.println("* {");
				out.println("margin: 0 auto;");
			out.println("}");
			
			out.println("fieldset {");
				out.println("width: 700px;");
			out.println("}");
		
			out.println("legend {");
				out.println("font-size: 1.5em;");
				out.println("font-weight: bold;");
			out.println("}");

			out.println("td, th {");
				out.println("padding: 5px;");
			out.println("}");
		out.println("</style>");
		
		//HTML
		out.println("<fieldset>");
			out.println("<legend>도서 목록 조회</legend>");
			out.println("<table border='1'>");
				out.println("<tr>");
					out.println("<th>도서명</th>");
					out.println("<th>저&nbsp;&nbsp;&nbsp;자</th>");
					out.println("<th style='letter-spacing: 3px'>ISBN</th>");
					out.println("<th>출판사</th>");
					out.println("<th>단&nbsp;&nbsp;&nbsp;가</th>");
					out.println("<th>수&nbsp;&nbsp;&nbsp;량</th>");
					out.println("<th>가&nbsp;&nbsp;&nbsp;격</th>");
					out.println("<th>삭&nbsp;&nbsp;&nbsp;제</th>");
				out.println("</tr>");
				for (BookDTO dto : list) {
					out.println("<tr align='center'>");
						out.println("<td>" + dto.getTitle() + "</td>");
						out.println("<td>" + dto.getAuth() + "</td>");
						out.println("<td>" + dto.getIsbn() + "</td>");
						out.println("<td>" + dto.getComp() + "</td>");
						out.println("<td>" + dto.getCost() + "</td>");
						out.println("<td>" + dto.getSu() + "</td>");
						out.println("<td>" + dto.getPrice() + "</td>");
						out.println("<td><a href='ds.do?isbn=" + dto.getIsbn() + "' style='text-decoration:none'>삭&nbsp;&nbsp;&nbsp;제</a></td>");
					out.println("</tr>");
				}
				out.println("<tr>");
					out.println("<td colspan='8' align='center'><input type=\"button\" value=\"도서 정보 입력\" onclick=\"location.href='BookMain.html'\"/></td>");
				out.println("</tr>");
			out.println("</table>");
		out.println("</fieldset>");
	}
}