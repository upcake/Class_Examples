package sec02;

import java.util.Scanner;

public class Q07_Scanner {
	public static void main(String[] args) {
		// while문과 Scanner를 이용해서 키보드로 입력된 데이터로 예금, 출금, 조회, 종료 기능을 제공하는 코드를 가로선 밑으로 작성하라.
		// 단, Scanner의 nextLine()을 사용한다.
		boolean run = true;
		int balance = 0;
		Scanner scanner = new Scanner(System.in);
		
		while(run) {
			System.out.println("--------------------------------");
			System.out.println("1. 예금 | 2. 출금 | 3. 잔고 | 4. 종료");
			System.out.println("--------------------------------");
			System.out.print("선택> ");
//			=====================================================================
			int choice = Integer.parseInt(scanner.nextLine());
			if(choice == 1) {
				System.out.print("예금액>");
				int deposit = Integer.parseInt(scanner.nextLine());
				balance += deposit;
				System.out.println();
			} else if(choice == 2) {
				System.out.print("출금액>");
				int withdraw = Integer.parseInt(scanner.nextLine());
				balance -= withdraw;
				System.out.println();
			} else if(choice == 3) {
				System.out.print("잔고>" + balance + "\n" + "\n");
			} else if(choice == 4) {
				break;
			} //if else if
		} // while
		System.out.println("\n" + "프로그램 종료");
		scanner.close();
	} // main()
} // class