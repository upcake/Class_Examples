import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.Socket;

// 받는 Thread : 메시지를 수신(입력) ▶ BufferedReader
public class Ex02_ChatReceiverThread extends Thread {	// Thread Class 상속
	private Socket socket;
	public Ex02_ChatReceiverThread(Socket socket) {
		this.socket = socket;
	}
	
	// Thread의 구현은 반드시 run() 메서드에서 재정의(Override)
	@Override
		public void run() {
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			InetAddress addr = socket.getInetAddress();
			String name = addr.getHostName(); // 호스트 이름 가져온다.
			
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					break;
				} // if
				System.out.println(name + ">수신 메시지 : " + msg);
			} // while
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("ChatReceiverThread Exception!!!");
			System.out.println("종료되었습니다.");
			System.exit(0);
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally
	} // run()
} // class