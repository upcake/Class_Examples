package sec02;

public class Ex08_ArrayCopyByForExample {
	public static void main(String[] args) {
		//for문으로 배열 복사
		int[] oldIntArray = {1, 2, 3};
		int[] newIntArray = new int[5];
		
		for (int i = 0; i < oldIntArray.length; i++) {
			newIntArray[i] = oldIntArray[i];
		} // for
		
		for (int i = 0; i < newIntArray.length; i++) {
			System.out.println(newIntArray[i] + ", ");
		} // for
	} // main()
} // class