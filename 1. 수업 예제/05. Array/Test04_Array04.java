public class Test04_Array04 {
	public static void main(String[] args) {
		/*
			○ 비정방형(가변길이) 배열을 이용한 별찍기
			★
			★★
			★★★
			★★★★
			★★★★★
		*/
		int[][] star = new int[5][];	// 가변길이 배열(star)을 선언 및 생성 
//		star[0] = new int[1];			// 첫 번째 행의 열의 길이 생성(1열)
//		star[1] = new int[2];			// 두 번째 행의 열의 길이 생성(2열)
//		star[2] = new int[3];			// 세 번째 행의 열의 길이 생성(3열)
//		star[3] = new int[4];			// 네 번째 행의 열의 길이 생성(4열)
//		star[4] = new int[5];			// 다섯 번째 행의 열의 길이 생성(5열)
		

		for (int i = 0; i < star.length; i++) {
			star[i] = new int[(star.length + 1) - i];
			for (int j = 1; j < star[i].length; j++) {
				System.out.print("★");
			} // for j
			System.out.println();
		} // for i	
		
//		// 각각의 요소에 ★을 할당 후 출력
//		int[][] star = new int[5][];
//		
//		for (int i = 0; i < star.length; i++) {
//			for (int j = 0; j < star[i].length; j++) {
//				star[i][j] = '★';
//				System.out.print((char)star[i][j]);
//			} // for j
//			System.out.println();
//		} // for i
	} // main()
} // class