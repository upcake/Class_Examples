public class Ex01_MyThread01Main {
	public static void main(String[] args) {
		// 객체 생성
		Ex01_MyThread01 thread01 = new Ex01_MyThread01();
		Ex01_MyThread02 thread02 = new Ex01_MyThread02();
		
		// thread01, thread02의 run() 메서드 호출
//		thread01.run();	// 1 ~ 30 출력
//		thread02.run(); // a ~ z 출력
		// thread01, thread02의 run() 메서드가 동시에 실행될 수 있도록 호출
		thread01.start();
		thread02.start();
	} // main()
} // class