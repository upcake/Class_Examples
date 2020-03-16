public class Ex02_Exception02 {
	public static void main(String[] args) {
		//가스불을 켠다 → 요리시작 → 요리끝 → 가스불을 잠근다 → 종료
		try {
			System.out.println("가스불을 켠다");
			System.out.println("요리시작");
			int a = 10 / 0;	//예외발생
			System.out.println("요리끝");
//			System.out.println("가스불을 잠근다");
//			System.out.println("종료");
		} catch (Exception e) {
			System.out.println("예외발생");
//			System.out.println("가스불을 잠근다");
//			System.out.println("종료");
		} finally {
			System.out.println("가스불을 잠근다");
			System.out.println("종료");
		}
	} // main ()
} // class