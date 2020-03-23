import com.hanul.book.BookDAO;
import com.hanul.book.BookDTO;

public class Ex01_BookMain {
	/*
	○ 도서관리(Ex01_BookMain.java) : default package
		- 3권의 도서 정보를 저장할 객체 배열 생성하고 값을 할당 ▶ BookDTO.java
			[JAVA, 신용권, 한빛, 24000, 16]
			[View, 김은옥, 삼양, 28000, 18]
			[Android, 정재곤, 이지, 40000, 11]
		- BookDAO.java	▶	객체 생성 시 객체배열(book[])을 매개 변수로 전달
			# 가격 계산
			# 출력
	○ 상태정보(BookDTO.java) : com.hanul.book package
		- 멤버 변수 선언
			title	name	company	cost	quantity	price
			String	String	String	int		int			int
		- 디폴트 생성자 메소드
		- 생성자 메소드 초기화
		- Getters and Setters 메소드
	○ 행위정보(BookDAO.java) : com.hanul.book package
		- getPrice() : 출력메소드
		- display() : 출력메소드
	*/
	
	public static void main(String[] args) {
		// 책 3권을 저장할 객체(BookDTO) 배열(book[])을 생성하고 초기화
		BookDTO[] book = new BookDTO[3];	// import 문을 지웠을 때는 Ctrl + Shift + O를 누르면 import 문이 추가된다.
		book[0]	= new BookDTO("JAVA", "신용권", "한빛", 24000, 16);
		book[1] = new BookDTO("View", "김은옥", "삼양", 28000, 18);
		book[2] = new BookDTO("Android", "정재곤", "이지", 40000, 11);
		
		// BookDAO.java의 메소드를 호출
		// BookDAO 객체 생성 시 객체배열(book[])을 매개 변수로 전달하자
		BookDAO dao = new BookDAO(book);
		dao.getPrice();	// 가격계산
		dao.display();	// 출력
	} // main()
} // class