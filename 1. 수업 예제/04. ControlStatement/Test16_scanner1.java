import java.util.Scanner;

public class Test16_scanner1 {
	public static void main(String[] args) {
		// 사용자로부터 출력하고 싶은 구구단을 입력(danNumber)받는다. ▶ Scanner
		// 입력받은 단의 구구단을 출력한다 ▶ 반복문(for, while, do~while)
		// 단, 입력받은 단의 범위는 2단부터 9단까지이며 ▶ if, break
		// 그 외의 단이 입력되면 오류메세지를 출력하고 재입력 받는다. ▶ while, continue
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("출력하고 싶은 단을 입력하세요 : ");
			int danNumber = scanner.nextInt();
			
			if(danNumber > 9 || danNumber < 2) {
				System.out.println("2 ~ 9 사이의 단수를 입력하세요!" + "\n");
				continue;
			} else {
				System.out.println(danNumber + "단을 출력합니다.");
				for(int i = 1; i < 10; i++) {
					if(danNumber * i < 10) {
						System.out.println(danNumber + " X " + i + " = 0" + danNumber*i);
					} else {
						System.out.println(danNumber + " X " + i + " = " + danNumber*i);
					} // if else
				} // for
			} // if else
			break;
		} // while
		scanner.close();
	} // main()
} // class