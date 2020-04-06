import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class Ex03_MultiChatReceiverThread extends Thread {

	private Socket socket;
	public Ex03_MultiChatReceiverThread(Socket socket) {
		this.socket = socket;
	}
	
	@Override
	public void run() {
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					br.close();
					break;
				}
				System.out.println(msg);
			}
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Receiver Exception!!!");
//			System.out.println("서버가 강제종료되었습니다.");
			System.exit(0);
		} finally {
			try {
				socket.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			} // try catch
		} // finally 
	} // run()
} // class