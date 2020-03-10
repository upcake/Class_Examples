package sec02;

public class Q04_forfor {
	public static void main(String[] args) {
		// 중첩 for문을 이용해서 방정식 4x + 5y = 60의 모든 해를 구해서 (x, y) 형태로 출력하라.
		// 단, x와 y는 10 이하의 자연수이다.
		for(int x = 1; x < 11; x++) {
			for(int y = 1; y < 11; y++) {
				if(4*x + 5*y == 60) {
					System.out.println("(" + x + "," + y + ")");
				} // if
			} // for y
		} // for x
	} // main()
} // class