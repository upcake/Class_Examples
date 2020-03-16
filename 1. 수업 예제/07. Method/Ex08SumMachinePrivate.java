import java.util.Scanner;

public class Ex08SumMachinePrivate {
	// 시작 값(startNum)과 종료 값(endNum)을 입력받은 후
	// makeSum() 메소드를 호출하고 결과 값(sum)을 return 받아 출력
	// makeSum() 메소드는 Ex06SumMachine.java, 07SumMachineReturn.java 클래스를 활용
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("시작 값을 입력하세요 : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("종료 값을 입력하세요 : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		Ex06SumMachine sm = new Ex06SumMachine();	// Ex06SumMachine 객체 생성
		sm.makeSum(startNum, endNum);		// 컨트롤 + 메소드 클릭 → 해당 클래스로 이동
		// public ~~ makeSum() : 접근제어자가 public 선언 ▶ 외부에서도 사용 가능
		
		Ex07SumMachineReturn smr = new Ex07SumMachineReturn();	// Ex07SumMachineReturn 객체 생성
//		smr.makeSum(startNum, endNum);	// 오류
		// private ~~ makeSum() : 접근제어자가 private 선언 ▶ 내부에서만 사용 가능(정보은닉)
	} // main()
} // class