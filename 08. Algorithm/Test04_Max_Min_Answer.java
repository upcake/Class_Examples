import java.util.Arrays;
import java.util.Scanner;

public class Test04_Max_Min_Answer {
	public static void main(String[] args) {
		Test04_Max_Min_Answer tmm = new Test04_Max_Min_Answer();
		int[] arr = tmm.input();
		tmm.maxMachine(arr);
		tmm.minMachine(arr);
		
	} // main()
	
	// 배열을 생성하고 정수를 입력받아 생성하고 할당하는 메소드 (메소드를 만들고 주석을 달아줄 것)
	public int[] input() {
			Scanner scanner = new Scanner(System.in);
			System.out.print("입력할 수의 개수를 입력하세요 : ");
			int[] arr = new int[Integer.parseInt(scanner.nextLine())];
			System.out.println();
			
			for (int i = 0; i < arr.length; i++) {
				System.out.print((i + 1) + "번째 정수를 입력하세요 : ");
				arr[i] = Integer.parseInt(scanner.nextLine());
			} // for
			System.out.println("입력을 완료하였습니다.");
			System.out.println();
			System.out.println();
			scanner.close();
			System.out.println("입력하신 수 : " + Arrays.toString(arr));
			return arr;
	} // input()
	
	// 배열의 최댓값을 구하고 출력하는 메소드
	public void maxMachine(int[] arr) {
		int max = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) {
				max = arr[i];
			} // if
		} // for
		System.out.println("최댓값 : " + max);
	} // maxMachine()
	
	// 배열의 최솟값을 구하고 출력하는 메소드
	public void minMachine(int[] arr) {
		int min = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(min > arr[i]) {
				min = arr[i];
			} // if
		} // for
		System.out.println("최솟값 : " + min);
	} // minMachine()
} // class