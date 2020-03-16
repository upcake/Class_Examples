import java.text.DecimalFormat;
import java.util.Scanner;

public class Test03_Method03_1 {
	// 임의의 정수 두 개를 입력받아(num1, num2)
	// 사칙연산을 수행하는, 메소드를 호출(add(), sub(), mul(), div()
	// 결과 값은 리턴하여 출력
	// 단, 나눗셈의 결과는 소수 둘째자리까지 표시 ▶ DecimalFormat Class
	// 0은 빈 칸을 0으로 채움, #은 의미 없는 0은 표기하지 않음
	public static void main(String[] args) {	
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("두 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		
		System.out.println("덧셈의 결과 : " + add(num1, num2));
		System.out.println("뺄셈의 결과 : " + sub(num1, num2));
		System.out.println("곱셈의 결과 : " + mul(num1, num2));
		System.out.println("나눗셈의 결과 : " + div(num1, num2));
		System.out.println("나눗셈의 결과 : " + divResult(num1, num2));
	} // main()
	
	// 메소드 구현
	public static int add(int x, int y) {
		return x + y;
	} // add()

	public static int sub(int x, int y) {
		return x - y;
	} // sub()
	
	public static int mul(int x, int y) {
		return x * y;
	} // mul()
	
	public static double div(double x, double y) {
		return x / y;
	} // div()

	public static String divResult(int x, int y) {
		DecimalFormat df = new DecimalFormat("0.00");	// DecimalFormat 사용하면 결과는 String Type
		return df.format((double)x / y);
	} // divResult()
} // class