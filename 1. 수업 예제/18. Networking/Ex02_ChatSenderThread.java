import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

// 보내는 Thread : 메시지를 송신(출력) ▶ PrintWriter
public class Ex02_ChatSenderThread extends Thread {
	private Socket socket;
	public Ex02_ChatSenderThread(Socket socket) {
		this.socket = socket;
	}
	
	// Thread 구현은 반드시 run() 메서드에서 재정의(Override)
		@Override
		public void run() {
			try {
				OutputStream os = socket.getOutputStream();
				PrintWriter pw = new PrintWriter(os);
				
				Scanner scanner = new Scanner(System.in);
				while(true) {
					System.out.print("전송할 메시지를 입력하세요 : ");
					String msg = scanner.nextLine();
					if(msg.equalsIgnoreCase("bye")) {
						System.out.println("종료되었습니다.");
						System.exit(0);		// break는 반복문만 빠져나오고 System.exit은 프로그램을 완전히 종료시킨다.
						break;
					} // if
					pw.println(msg);
					pw.flush();
				} // while
				scanner.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("ChatSenderThread Exception!!!");
			} finally {
				try {
					socket.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} // try catch finally
		} // run()
} // class