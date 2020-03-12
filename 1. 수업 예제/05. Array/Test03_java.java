import java.util.Random;
import java.util.Scanner;

public class Test03_java {

	public static void main(String[] args) {
		// Test.java : 반장선출 프로그램
		// 학생목록이 저장될 배열 생성 : String[] student = new String[16];
		// 1번 ~ 16번 학생의 이름을 입력받아 배열에 저장 : Scanner
		// # 1번 학생의 이름을 입력 : XXX
		// # 16번 학생의 이름을 입력 : XXX
		// - 입력이 완료되면 입력한 학생의 목록을 출력한다
		// # 입력을 완료하셨습니다!
		// # 1번 : XXX
		// # 16번 : XXX
		// 반장 선출을 위해 Enter Key를 입력받아, 무작위로 할당된 정수 값을 기준으로 해당 번호에 해당되는 학생을 반장으로 선출한다.
		// # 반장을 선출합니다. Enter Key를 입력하세요!
		// X번 학생이 XXX님이 선출되었습니다.
		// # 축하합니다!
		String[] student = new String[16];
		Scanner scanner = new Scanner(System.in);
		
		// 학생 이름 입력
		for (int i = 0; i < student.length; i++) {
			if((i + 1) < 10) {
				System.out.print("0");
			} // if
			System.out.print((i + 1) + "번 학생의 이름을 입력 : ");
			student[i] = scanner.nextLine(); 
		} // for
		System.out.println("=======================================" + "\n");
		
		// 학생 이름 출력
		for (int i = 0; i < student.length; i++) {
			if((i + 1) < 10) {
				System.out.print("0");
			} // if
			System.out.print((i + 1) + "번 학생 : " + student[i] + "\t");
			if((i + 1) % 4 == 0) {
				System.out.println();
			} // if
		} // for
		System.out.println("=======================================" + "\n");
		
		// 반장 선출
		Random random = new Random();
		System.out.println("반장 선출을 선출합니다. Enter key를 입력하세요!");
		scanner.nextLine();
		int classLeader = random.nextInt(16);
		System.out.println("축하합니다! " + (classLeader + 1) + "번 학생 " + student[classLeader] + "님이 선출되었습니다.");
	} // main()
} // class