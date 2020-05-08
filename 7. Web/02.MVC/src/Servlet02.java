import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumMachine;

@WebServlet("/sc02.do")
public class Servlet02 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//① 클라이언트의 요청을 받는다(HttpServletRequest) : 매개 변수 값을 가져온다.
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		//② 비즈니스 로직 : 별도의 클래스로 작성(Model) ▶ Package : com.hanul.study
		SumMachine sm = new SumMachine(); 
		int sum = sm.getSum(num1, num2);
		
		//③ 프레젠테이션 로직 : 결과를 응답(HttpServletResponse) ▶ result.jsp(View)
		request.setAttribute("num1", num1); //바인딩(연결) 객체
		//setAttribute(이름, 내용), 내용을 이름에 연결해주는 메서드
		request.setAttribute("num2", num2);
		request.setAttribute("sum", sum);
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp"); //페이지 호출
		rd.forward(request, response); // 페이지 전환
	}
}