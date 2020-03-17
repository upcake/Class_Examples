import java.util.Arrays;

public class Ex04Min {
	public static void main(String[] args) {
		// 정수형 배열(arr[])의 원소 값 중에서 최솟값(min)을 구하여 출력
		int[]arr = {3, 2, 1, 4, 5}; // 정수형 배열(arr[])을 선언하고 값을 할당 : 초기화
		
		int min = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(min > arr[i]) {	// 현재의 최솟값(min)과 배열(arr[])의 원솟값을 각각 비교
				min = arr[i];	// 배열 원소 값(arr[i])이 더 작으면, 최솟값을 변경(arr[i]의 값으로 재할당)
			} // if
		} // for
		
		System.out.println("배열의 원소 값 : " + Arrays.toString(arr));
		System.out.println("원소의 최솟값 : " + min);
		//========================================
		Arrays.sort(arr);	// 배열(arr[])을 오름차순으로 정렬
		System.out.println("배열의 원소 값 : " + Arrays.toString(arr));
		System.out.println("원소의 최솟값 : " + arr[0]);
	} // main()
} // class