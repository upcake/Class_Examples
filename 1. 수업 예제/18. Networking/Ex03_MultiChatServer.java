import java.net.ServerSocket;
import java.net.Socket;

public class Ex03_MultiChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;		
		try {
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			while(true) {
				Socket socket = ss.accept();
				Thread pt = new Ex03_MultiChatPersonThread(socket);
				pt.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Server Exception!!!");
		} /* finally { // 서버가 계속 구동되고 소켓이 닫히면 안되므로 닫아줄 필요가 없다.
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} */
	} // main()
} // class