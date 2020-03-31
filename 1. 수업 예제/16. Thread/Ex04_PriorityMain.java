public class Ex04_PriorityMain {
	public static void main(String[] args) {
		// 객체 생성
		Ex04_Priority priority1 = new Ex04_Priority(); 
		Ex04_Priority priority2 = new Ex04_Priority(); 
		Ex04_Priority priority3 = new Ex04_Priority();
		
		// 우선 순위 설정, 우선 순위가 높을 수록 CPU 점유 시간이 길어짐
		priority1.setPriority(1);
		priority2.setPriority(5);
		priority3.setPriority(10);
		
		// 쓰레드 실행
		priority1.start();
		priority2.start();
		priority3.start();
	} // main()
} // class