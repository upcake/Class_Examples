package sec02;

public class Q06_Star2 {
	public static void main(String[] args) {
		// for문을 이용해서 다음과 같이 출력하시오.
		//    *
		//   **
		//  ***
		// ****
		// ...*
		// ..**
		// .***
		// ****
		for(int i = 4; i > 0; i--) {
			for(int j = 1; j < 5; j++) {
				if(i <= j) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				} // if
			}	// for j
			System.out.println();
		} // for i
	} // main()
} // class