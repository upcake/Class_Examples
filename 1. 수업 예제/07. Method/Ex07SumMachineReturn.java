import java.util.Scanner;

public class Ex07SumMachineReturn {
	// 시작 값(startNum)과 종료 값(endNum)을 입력받은 후
	// makeSum() 메소드를 호출하고 결과 값(sum)을 return 받아 출력
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("시작 값을 입력하세요 : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("종료 값을 입력하세요 : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		
		System.out.println("시작 값 : " + startNum);
		System.out.println("종료 값 : " + endNum);
//		System.out.println("누적 합 : " + makeSum(startNum, endNum));
		Ex07SumMachineReturn smr = new Ex07SumMachineReturn();
		System.out.println("누적 합 : " + smr.makeSum(startNum, endNum));
	} // main()
	
	// 시작 값과 종료 값까지 누적 합(sum)을 구하고 결과를 리턴하는 메소드(makeSum())를 정의
	private int makeSum(int x, int y) {	// static 제거, public → private 변경
		int sum =0;
		for(int i = x; i <= y; i++) {
			sum += i;
		} // if
		return sum;
	} // makeSum()
} // class