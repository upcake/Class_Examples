import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hs.do")	//Servlet Mapping 자동 설정
public class HelloServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");	// MIME TYPE
		PrintWriter out = response.getWriter(); //응답(출력) 준비 완료
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Response Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>Welcome to Hello Servlet!</h2>");
		out.println("<h2>안녕하세요</h2>");
		out.println("</body>");
		out.println("</html>");
	}
}