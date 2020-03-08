package sec02;

public class Ex02_IncreaseDecreaseOperatorExample {
	public static void main(String[] args) {
		// 증감 연산자	
		int x = 10;
		int y = 10;
		int z;
		
		System.out.println("-----------------------");
		x++;
		++x;
		System.out.println("x = " + x);
		
		System.out.println("-----------------------");
		y--;
		--y;
		System.out.println("y = " + y);
		
		System.out.println("-----------------------");
		z = x++;
		System.out.println("z = " + z);
		System.out.println("x = " + x);
		
		System.out.println("-----------------------");
		z = ++x;
		System.out.println("z = " + z);
		System.out.println("x = " + x);
		
		System.out.println("-----------------------");
		z = ++x + y++;
		System.out.println("z = " + z);
		System.out.println("x = " + x);
		System.out.println("y = " + y);
	} // main()
} // class