// 동시작업 : 쓰레드(Thread) ▶ Thread 클래스를 상속받아 run() 메서드에 구현
public class Ex01_MyThread01 extends Thread {
	// 1 ~ 30 출력하는 코드 구현 : run() 메서드에서 재정의(Override)
	@Override
	public void run() {
		for (int i = 1; i < 31; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	} // run()
} // class

// 접근 제어자는 파일명과 이름이 같은 클래스에만 붙여준다.
class Ex01_MyThread02 extends Thread {
	// a ~ z 출력하는 코드 구현
	@Override
	public void run() {
//		for (char i = 97; i <= 122; i++) {
		for (char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	}
} // class