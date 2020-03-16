import java.util.Scanner;

public class Ex06SumMachine {
	// 시작 값(startNum)과 종료 값(endNum)을 입력받은 후, makeSum() 메소드를 호출
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("시작 값 : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("종료 값 : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
//		makeSum(startNum, endNum);						// 오류 : makeSum() 메소드에 static이 없다
		Ex06SumMachine sm = new Ex06SumMachine(); 		// 객체를 생성
		sm.makeSum(startNum, endNum); 					// 생성된 객체 안에 있는 메소드를 호출
	} // main()
	
	// 시작 값과 종료 값까지 누적 합을 구하고 출력하는 메소드(makeSum())를 정의
	public void makeSum(int x, int y) {	//static 제거
		int sum = 0;
		for(int i = x; i <= y; i++) {
			sum += i;
		} // for
		System.out.println("누적 합 : " + sum);
	} // makeSum()
} // class