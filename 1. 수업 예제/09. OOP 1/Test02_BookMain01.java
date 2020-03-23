public class Test02_BookMain01 {
	public static void main(String[] args) {
		// 객체를 생성하고 값을 할당한 후 출력
		// book1	JAVA	24000원	한빛미디어		신용권
		// book2	View	28000원	삼양미디어		김은옥
		// book3	Android	40000원	이지스퍼블리싱	정재곤
		Test02_Book book1 = new Test02_Book();
		book1.title = "JAVA";
		book1.price = 24000;
		book1.company = "한빛미디어";
		book1.name = "신용권";
		
		Test02_Book book2 = new Test02_Book();
		book2.title = "View";
		book2.price = 28000;
		book2.company = "삼양미디어";
		book2.name = "김은옥";
		
		Test02_Book book3 = new Test02_Book();
		book3.title = "Android";
		book3.price = 40000;
		book3.company = "이지스퍼블리싱";
		book3.name = "정재곤";
		
		// 출력
		book1.display();
		book2.display();
		book3.display();
	} // main()
} // class