import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sc01.do")
public class Servlet01 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//① 클라이언트의 요청을 받는다 : 폼의 매개 변수를 가져온다 ▶ HttpServletRequest
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		//② 비지니스 로직(num1 ~ num2 누적합 계산) ▶ Model(Class, DTO, DAO)
		int sum = 0;
		for(int i = num1; i <= num2; i++) {
			sum += i;
		}
		
		//③ 프리젠테이션 로직 : 결과를 html 코드로 응답 (HttpServletResponse) ▶ View
		response.setContentType("text/html; charset=utf-8");	//MIME Type
		PrintWriter out = response.getWriter();
		out.println("<body>");
		out.println("첫 번째 수 : " + num1 + "<br />");
		out.println("두 번째 수 : " + num2 + "<br />");
		out.println("두 수 사이의 누적합 : " + sum);
		out.println("</body>");
	}
}