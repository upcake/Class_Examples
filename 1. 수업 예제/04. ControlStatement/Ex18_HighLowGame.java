import java.util.Random;
import java.util.Scanner;

public class Ex18_HighLowGame {
	public static void main(String[] args) {
		// ○ 숫자 맞추기 게임 : HighLowGame
		// 1 ~ 100 사이의 임의의 정수 값을 할당 하여 comNumber에 저장 ▶ Random
		Random random = new Random();				// Random 객체를 생성
		int comNumber = random.nextInt(100) +1;		// 1 ~ 100 사이의 임의의 정수 값을 할당
		
		// 사용자로부터 숫자를 입력받기 위한 준비 ▶ Scanner
		Scanner scanner = new Scanner(System.in);	// Scanner 객체를 생성
		int userNumber = 0;							// 사용자가 입력한 값을 저장할 변수
		int count = 0;								// 시도 횟수를 저장할 변수를 초기화
		
		// 게임시작
		do {
			System.out.print("1부터 100 사이의 정수 값을 입력하세요 : ");
			userNumber = Integer.parseInt(scanner.nextLine());
			count++;
			
			if(comNumber > userNumber) {
				System.out.println("더 큰 수를 입력하세요!");
				continue;
			} else if(comNumber < userNumber) {
				System.out.println("더 작은 수를 입력하세요!");
				continue;
			} else {
				System.out.println("맞췄습니다!");
				System.out.println("시도 횟수는 " + count + "번 입니다.");
				break;
			}
		} while(true);
		scanner.close();
	} // main()
} // class