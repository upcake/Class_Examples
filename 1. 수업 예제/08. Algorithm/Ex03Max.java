import java.util.Arrays;

public class Ex03Max {
	public static void main(String[] args) {
		// 정수형 배열(arr[])의 원소 값 중에서 최대 값(max)을 구하여 출력
		int[] arr = {3, 2, 4, 1, 5};	// 정수형 배열(arr[])을 선언하고 값을 할당 : 초기화

		int max = arr[0];				// 최대 값이 저장될 변수(max)를 초기화 ▶ 배열의 첫번째 index 할당
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) {			// 현재의 최대 값(max)과 배열(arr[])의 원소 값을 비교
				max = arr[i];			// 배열 원소 값(arr[i])이 더 크면, 최대 값을 변경(arr[i]의 값으로 재할당)
			} // if
		} // for
		
		System.out.println("배열의 원소 값 : " + Arrays.toString(arr));
		System.out.println("원소의 최대 값 : " + max);
		//========================================
		Arrays.sort(arr);	// 배열(arr[])을 오름차순으로 정렬
		System.out.println("배열의 원소 값 : " + Arrays.toString(arr));
		System.out.println("원소의 최대 값 : " + arr[arr.length - 1]);
	} // main()
} // class