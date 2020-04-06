import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;

/*
 - 접속된 다수의 클라이언트에서 동작되는 쓰레드
 - 접속된 모든 클라이언트의 접속 정보를 저장하고,
 	접속된 클라이언트에게 메시지를 전송(송신, 출력)할 수 있도록
 	클라이언트의 목록을 저장할 무한 배열을 생성하여 동작
 - MultiChatServer Class의 main() 메서드와 같이 동작 : static
 */
public class Ex03_MultiChatPersonThread extends Thread {
	static ArrayList<PrintWriter> list = new ArrayList<>();	
	// 접속한 클라이언트의 모든 정보가 ArrayList에 들어오고 Element에 PrintWriter를 넣어서 전송한다
	
	private Socket socket;
	private PrintWriter pw;
	public Ex03_MultiChatPersonThread(Socket socket) {
		this.socket = socket;
		try {
			OutputStream os = socket.getOutputStream();
			pw = new PrintWriter(os);
			list.add(pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		String name = null;
		InetAddress addr = socket.getInetAddress();
		String comName = addr.getHostName();
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			// 클라이언트에서 가장 먼저 입력된 메시지(대화명)를 출력
			// 접속된 다른 클라이언트 화면에 출력 : sendAll()
			name = br.readLine();
			sendAll("#" + name + "(" + comName + ")님이 입장하셨습니다!");
			// #홍길동(302-XX)님이 입장하셨습니다!
			
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					break;
				}
				sendAll(name + "(" + comName + ") : " + msg);
				// 홍길동(302-XX) : 안녕
			}
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Person Exception!!!");
//			System.out.println("종료되었습니다!");
		} finally {
			try {
				list.remove(pw);
				sendAll("#" + name + "(" + comName + ")님이 퇴장하셨습니다!");
				// #홍길동(302-XX)님이 퇴장하셨습니다!
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	} // run()
	
	public void sendAll(String msg) {
		for (PrintWriter pw : list) {
			pw.println(msg);
			pw.flush();
		}
	} // sendAll()
} // class