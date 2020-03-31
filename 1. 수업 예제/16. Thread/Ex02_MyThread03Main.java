public class Ex02_MyThread03Main {
	public static void main(String[] args) {
		// 하나의 작업(MyThread03. java)을 동시에 실행되게 하자.
		// Thread Class는 하나만 만들고, 객체를 여러개 생성해서 실행하면 된다
		Ex02_MyThread03 thread0 = new Ex02_MyThread03();
		Ex02_MyThread03 thread1 = new Ex02_MyThread03();
		Ex02_MyThread03 thread2 = new Ex02_MyThread03();
		
		//쓰레드의 실행은 start() 메소드로 호출
		thread0.start();
		thread1.start();
		thread2.start();
	} // main()
} // class