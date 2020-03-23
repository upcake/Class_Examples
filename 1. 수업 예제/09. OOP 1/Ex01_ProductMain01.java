public class Ex01_ProductMain01 {
	public static void main(String[] args) {
		Ex01_Product p1;			// Ex01_Product Type을 갖는 변수 p1을 선언 : 인스턴스(instance), 레퍼런스(reference)
		p1 = new Ex01_Product();	// p1이 사용할 메모리를 new 키워드로 할당받고, 생성자 메소드를 호출
//		Ex01_Product p1 = new Ex01_Product();	// Ex01_Product Class를 활용하기 위해 객체 p1을 생성
		p1.num = 1;			// p1의 멤버변수 num에 1을 할당 : 참조변수.멤버변수로 접근
		p1.name = "컴퓨터";	// p1의 멤버변수 name에 컴퓨터를 할당

		Ex01_Product p2 = new Ex01_Product();
		p2.num = 2;
		p2.name = "노트북";
		
		Ex01_Product p3 = new Ex01_Product();
		p3.num = 3;
		p3.name = "프린터";
		
		System.out.println("객체 p1의 정보");
		System.out.println("num : " + p1.num);
		System.out.println("name : " + p1.name);
		System.out.println("====================");
		
		System.out.println("객체 p2의 정보");
		System.out.println("num : " + p2.num);
		System.out.println("name : " + p2.name);
		System.out.println("====================");

		System.out.println("객체 p3의 정보");
		System.out.println("num : " + p3.num);
		System.out.println("name : " + p3.name);
		System.out.println("====================");
	} // main()
} // class