public class Ex01_ProductMain02 {
	public static void main(String[] args) {
		Ex01_Product p1 = new Ex01_Product();
		p1.num = 1;			
		p1.name = "컴퓨터";	

		Ex01_Product p2 = new Ex01_Product();
		p2.num = 2;
		p2.name = "노트북";
		
		Ex01_Product p3 = new Ex01_Product();
		p3.num = 3;
		p3.name = "프린터";
		
		System.out.println("객체 p1의 정보");
		p1.display();
		System.out.println("====================");
		
		System.out.println("객체 p2의 정보");
		p2.display();
		System.out.println("====================");

		System.out.println("객체 p3의 정보");
		p3.display();
		System.out.println("====================");
	} // main()
} // class