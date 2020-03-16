package sec02;

public class Q04_Array_for {
	public static void main(String[] args) {
		// for문을 이용해서 배열의 항목에서 최대값 구하기
		int max = 0;
		int[] array = {1, 5, 3, 8, 2};
		
		//작성 위치
		for (int i = 0; i < array.length; i++) {
			if(array[i] > max) {
				max = array[i];
			} // if
		} // for i

		System.out.println("max : " + max);
	} // main()
} // class