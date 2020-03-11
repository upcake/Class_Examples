import java.util.Random;
import java.util.Scanner;

public class Ex17_DiceGame {
	public static void main(String[] args) {
		// ○ Dice Game(주사위게임)
		// 게임 시작 : 1, 게임 종료 : -1을 입력하세요 ▶ X
		// 숫자를 잘못 입력 하셨습니다!
		
		// 게임시작 : 1, 게임 종료 : -1을 입력하세요 ▶ -1
		// 게임을 종료합니다.
		
		// 게임시작 : 1, 게임 종료 : -1을 입력하세요 ▶ 1
		// 주사위 게임을 시작합니다^~^
		
		// 사용자가 주사위를 굴립니다.
		// Enter Key를 입력하세요!
		// 1 ~ 6 사이의 정수 중에서 무작위(임의적)로 숫자를 할당 : userNumber
		// 사용자의 숫자는 X입니다.
		
		// 컴퓨터가 주사위를 굴립니다.
		// Enter Key를 입력하세요!
		// 1 ~ 6 사이의 정수 중에서 무작위(임의적)로 숫자를 할당 : comNumber
		// 컴퓨터의 숫자는 X입니다.
		
		// userNumber와 comNumber 비교 : You Win! // You Lose! // Draw!
		Scanner scanner = new Scanner(System.in);	// 입력을 받기 위한 객체 생성
		Random random = new Random();				// 무작위로 숫자를 할당하기 위한 객체 생성
		
		// 1, -1 이외의 숫자가 입력되면 오류메세지를 출력하고 재입력
		while(true) {
			System.out.print("게임 시작 : 1, 게임 종료 : -1을 입력하세요 ▶ ");
			int userInput = Integer.parseInt(scanner.nextLine());
			if(userInput != 1 && userInput != -1) {
				System.out.println("숫자를 잘못 입력하셨습니다!");
				continue;
			} // if 
			
			// -1이 입력되면 게임을 종료(while 문을 탈출)
			if(userInput == -1) {
				System.out.println("게임을 종료합니다!");
				break;
			} // if
			
			// 게임을 시작 : 컴퓨터의 숫자를 무작위로 할당
			System.out.println("주사위 게임을 시작합니다 ^~^");
			System.out.println("컴퓨터가 주사위를 굴립니다.");
			System.out.println("Enter Key를 입력하세요!");
			int comNumber = random.nextInt(6) + 1;
			System.out.println("컴퓨터의 숫자는 " + comNumber + "입니다.\n");
			
			// 승패를 결정, 목표 승무패 7:1:2
			int result = random.nextInt(10) + 1;	// 결과 변수 result를 1 ~ 10으로 설정
			int userNumber = 0;
			
			if(result > 3) {						// 사용자 승리 but comN=6일땐 무승부
				if(comNumber == 6) {
					userNumber = 6;
				} else {
					userNumber = 6 - random.nextInt(6 - comNumber);
				} // if else
			} // if win

			if(result == 3) {						// 무승부
				userNumber = comNumber;
			} // if draw
			
			if(result < 3) {						// 사용자 패배 but comN=1일땐 무승부
				if(comNumber == 1) {
					userNumber = 1;
				} else {
					userNumber = random.nextInt(comNumber - 1) + 1;
				} // if else
			} // if lose
			
			// 사용자의 숫자를 무작위로 할당
			System.out.println("사용자가 주사위를 굴립니다.");
			System.out.print("Enter Key를 입력하세요!");
			scanner.nextLine();		// 블록킹 메소드 : 사용자로부터 입력을 대기하고, 입력이 되면 입력값을 처리
			System.out.println("사용자의 숫자는 " + userNumber + "입니다.\n");
			
			// 사용자의 숫자(userNumber와 컴퓨터의 숫자(comNumber)를 비교해서 결과를 출력
			if(userNumber > comNumber) {
				System.out.println("Result : You Win!!!");
			} else if(userNumber < comNumber) {
				System.out.println("Result : You Lose!!!");
			} else {
				System.out.println("Result : Draw!!!");
			} // if
		} // while
		scanner.close();
	} // main()
} // class