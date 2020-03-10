import java.util.Scanner;

public class Test16_scanner2_operator {
	public static void main(String[] args) {
		// 두 개의 정수를 입력(num1, num2)받은 후에, 사칙연산을 수행하고 결과를 출력
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("두 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		System.out.println("덧셈의 결과 : " + (num1 + num2));
		System.out.println("뺄셈의 결과 : " + (num1 - num2));
		System.out.println("곱셈의 결과 : " + (num1 * num2));
		System.out.println("나눗셈의 결과 : " + ((double)num1 / num2));
	} // main()
} // class