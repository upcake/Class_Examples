package com.hanul.book;

public class BookDAO {

/*	private BookDTO[] book;	// 멤버 변수 : 생성자 메소드와 현재 클래스 내부에서만 사용
	public BookDAO() {}		// 디폴트 생성자 메소드(생략 가능)
	public BookDAO(BookDTO[] book) {	// 객체 배열(book[])을 매개 변수로 전달 받는 생성자 메소드를 초기화
		super();			// 없어도 상관 없음, 생략 가능
		this.book = book;
	}*/
		
	private BookDTO[] book;	// 멤버 변수 : 생성자 메소드와 현재 클래스 내부에서만 사용
	public BookDAO(BookDTO[] book) {
		this.book = book;
	}
	
	// 가격 계산
	public void getPrice() {
		for (int i = 0; i < book.length; i++) {
//			int price = book[i].getPrice() * book[i].getQuantity();
//			book[i].setPrice(price);
			book[i].setPrice(book[i].getCost() * book[i].getQuantity());
		} // for
	} // getPrice()

	// 출력
	public void display() {
		System.out.println("제목\t저자\t출판사\t단가\t수량\t가격");
		System.out.println("==============================================");
		for (int i = 0; i < book.length; i++) {
			System.out.print(book[i].getTitle() + "\t");
			System.out.print(book[i].getName() + "\t");
			System.out.print(book[i].getCompany() + "\t");
			System.out.print(book[i].getCost() + "\t");
			System.out.print(book[i].getQuantity() + "\t");
			System.out.print(book[i].getPrice() + "\n");
		} // for
	} // display()	
} // class