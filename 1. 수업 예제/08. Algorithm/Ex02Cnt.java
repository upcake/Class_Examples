import java.util.Scanner;

public class Ex02Cnt {
	public static void main(String[] args) {
		// 두 개의 정수를 입력받아(num1, num2) 두 수 사이의 정수의 개수(cnt)를 출력
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		int cnt = 0;	// 개수를 저장할 변수(cnt)를 초기화
		for(int i = num1; i <= num2; i++) {
			cnt++;	// cnt = cnt +1; / cnt += 1;
		} // for
		
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		System.out.println("두 수 사이의 정수의 개수 : " + cnt);
	} // main()
} // class