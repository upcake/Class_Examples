import java.util.Arrays;
import java.util.Scanner;

public class Test04_Max_Min {
	// 정수형 배열의 길이를 입력받은 후, 배열 생성(arr[]) ▶ Scanner
	// arr[] 배열의 길이에 맞게 임의의 정수를 입력받아 배열에 할당 ▶ for
	// maxMachine() : 배열(arr[])의 최댓값(max)을 구하여 출력
	// minMachine() : 배열(arr[])의 최솟값(min)을 구하여 출력
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("입력할 수의 개수를 입력하세요 : ");
		int[] arr = new int[Integer.parseInt(scanner.nextLine())];
		System.out.println();
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "번째 정수를 입력하세요 : ");
			arr[i] = Integer.parseInt(scanner.nextLine());
//			if(i == (arr.length - 1)) {
//				System.out.println("입력을 완료하였습니다.");
//				System.out.println();
//			} // if
		} // for
		System.out.println("입력을 완료하였습니다.");
		System.out.println();
		scanner.close();
		
//		System.out.print("입력하신 수 : [");
//		for (int i = 0; i < arr.length; i++) {
//			System.out.print(arr[i] + ", ");
//			if(i == (arr.length - 1)) {
//				System.out.println("\b" + "\b" + "]");
//			} // if
//		} // for
		
		System.out.println("입력하신 수 : " + Arrays.toString(arr));
		
		Test04_Max_Min mac = new Test04_Max_Min();
		mac.maxMachine(arr);
		mac.minMachine(arr);
	} // main()
	
	public void maxMachine(int[] arr) {
		int max = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) {
				max = arr[i];
			} // if
		} // for
		System.out.println("최댓값 : " + max);
	} // maxMachine()
	
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