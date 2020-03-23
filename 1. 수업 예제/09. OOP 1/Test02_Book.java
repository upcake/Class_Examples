public class Test02_Book {
	// 멤버 변수 : 제목(title), 가격(price), 출판사(company), 저자(name)
	// 멤버 메소드 : 출력 메소드(display())
	String title;
	int price;
	String company;
	String name;

	public void display() {
		System.out.println("제목 : " + title);
		System.out.println("가격 : " + price + "원");
		System.out.println("출판사 : " + company);
		System.out.println("저자 : " + name);
		System.out.println("======================");
	} // display()
} // class