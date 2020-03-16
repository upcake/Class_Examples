import java.util.Scanner;

public class Test03_Method03_2 {
	// 임의의 정수 두개를 입력받아(su1, su2)
	// 짝수의 합(evenSum)과 홀수의 합(oddSum)을 구하는 메소드 호출(evenSum(), oddSum())
	// 결과 값은 리턴하여 출력
	// 단, 첫 번째 정수는 작은 수를 입력 받고, 두 번째 정수는 큰 수를 입력받는다.
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int su1 = 0;
		int su2 = 0;
		
		while(true) {
			System.out.print("첫 번째 정수를 입력하세요 : ");
			su1 = Integer.parseInt(scanner.nextLine());
			System.out.print("두 번째 정수를 입력하세요 : ");
			su2 = Integer.parseInt(scanner.nextLine());
			System.out.println();
			
			if(su1 > su2) {
				System.out.println("첫 번째 정수는 작은 수, 두 번째 정수는 큰 수를 입력하세요!");
				System.out.println("=======================================");
				continue;
			} // if
			break;
		} // while
		scanner.close();

		System.out.println("첫 번째 정수 : " + su1);
		System.out.println("두 번째 정수 : " + su2);
		System.out.println(su1 + "부터 " + su2 + "까지의 짝수의 누적 합 : " + evenSum(su1, su2));
		System.out.println(su1 + "부터 " + su2 + "까지의 홀수의 누적 합 : " + oddSum(su1, su2));
	} // main()
	
	// 짝수의 합
	public static int evenSum(int x, int y) {
		int evenSum = 0;
		for(int i = x; i <= y; i++) {
			if(i % 2 == 0) {
				evenSum += i;
			} // if
		} // for
		return evenSum;
	} // evenSum()
	
	// 홀수의 합
	public static int oddSum(int x, int y) {
		int oddSum = 0;
		for(int i = x; i <= y; i++) {
			if(i % 2 == 1) {
				oddSum += i;
			} // if
		} // for
		return oddSum;
	} // oddSum()
} // class