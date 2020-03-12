import java.util.Arrays;

public class Test02_Array02 {
	public static void main(String[] args) {
		// 초기화된 배열(arr)에서 홀수의 합(oddSum)과 짝수의 합(evenSum)을 구하여 출력
		int[] arr = {1, 4, 5, 8, 3, 7, 9, 2, 6};	// 배열(arr)을 선언하고 동시에 값을 할당 : 초기화
		int oddSum = 0, evenSum = 0;				// 결과가 저장될 변수를 초기화
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 1) {
				oddSum += arr[i];
			} else {
				evenSum += arr[i];
			} // if else
		} // for
		
		System.out.println("배열(arr)의 원소 값 : " + Arrays.toString(arr));
		System.out.println("홀수의 합 : " + oddSum);
		System.out.println("짝수의 합 : " + evenSum);
	} // main()
} // class