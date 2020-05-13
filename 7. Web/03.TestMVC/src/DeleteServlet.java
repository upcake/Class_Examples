import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;

@WebServlet("/ds.do")
public class DeleteServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트의 요청 받기
		String isbn = request.getParameter("isbn");
		
		//비즈니스 로직
		BookDAO dao = new BookDAO();
		int succ = dao.delete(isbn);
		
		//프레젠테이션 로직
		response.setContentType("text/html; charset=utf-8"); //MIME Type
		PrintWriter out = response.getWriter();
		if(succ > 0) {
			out.println("<script>alert('도서 정보 삭제 성공');</script>");
			out.println("<a href='BookMain.html'>도서 정보 입력 하기</a>");
			out.println("<br />");
			out.println("<a href='gals.do'>도서 목록 조회 하기</a>");
		} else {
			out.println("<script>alert('도서 정보 삭제 실패');</script>");
			out.println("<a href='BookMain.html'>도서 정보 입력 하기</a>");
			out.println("<br />");
			out.println("<a href='gals.do'>도서 목록 조회 하기</a>");
		} //if else
	}
}