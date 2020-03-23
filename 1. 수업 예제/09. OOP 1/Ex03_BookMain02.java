public class Ex03_BookMain02 {
	public static void main(String[] args) {
		// 도서 정보(Ex03_BookDTO)를 저장할 객체 배열(book[])을 선언
		Ex03_BookDTO[] book;
		// 3권의 도서 정보가 저장될 객체배열(book[])을 생성
		book = new Ex03_BookDTO[3];
//		Ex03_BookDTO[] book = new Ex03_BookDTO[3];	// 객체 배열을 선언 및 생성
		
		// Ex03_BookDTO.java의 생성자 메소드를 이용하여 초기화 : 도서 정보의 내용(값)을 입력
		book[0] = new Ex03_BookDTO("JAVA", 24000, "한빛미디어", "신용권"); // 탭 키로 각 항목 이동 가능
		book[1] = new Ex03_BookDTO("View", 28000, "삼양미디어", "김은옥");
		
		// 디폴트 생성자 메소드를 이용하여 값을 할당
		Ex03_BookDTO dto = new Ex03_BookDTO();
		dto.setTitle("Android");
		dto.setPrice(40000);
		dto.setCompany("이지스퍼블리싱");
		dto.setName("정재곤");
		book[2] = dto;

		// 도서 정보(book[])의 내용을 출력 : Ex03_BookDAO.java → display() 메소드 호출
		Ex03_BookDAO dao = new Ex03_BookDAO();
		dao.display(book);
	} // main()
} // class