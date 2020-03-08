package sec02;

import java.util.Scanner;

public class Q09_Scanner1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("첫 번째 수 : ");
		String a = scanner.nextLine();
		
		System.out.print("두 번째 수 : ");
		String b = scanner.nextLine();
		System.out.println("--------------------------");

		double num1 = Double.parseDouble(a);
		double num2 = Double.parseDouble(b);
		double result = num1 / num2;
		
		if((num2 == 0) || (num2 == 0.0)) {
			System.out.println("결과 : 무한대");
			} else {System.out.println("결과 : " + result);
		} // if
	} // main()
} // class