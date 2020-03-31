public class Ex03_MyThread04Main {
	public static void main(String[] args) {
		// 객체 생성
		Ex03_MyThread04 run1 = new Ex03_MyThread04();
		Ex03_MyThread05 run2 = new Ex03_MyThread05();
		
		// Rnnable Interface를 상속받아 구현한 Thread는 진짜 쓰레드가 아니다.
		// Thread 객체를 생성하고, Runnable을 매개 변수로 전달한다.
		Thread thread1 = new Thread(run1);
		Thread thread2 = new Thread(run2);
//		Thread thread = new Thread(new Ex03_MyThread04());
		
		// Thread의 실행은 start() 메서드를 호출
		thread1.start();
		thread2.start();
	} // main()
} // class