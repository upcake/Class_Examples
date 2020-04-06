import java.net.Socket;

public class Ex03_MultiChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.20", 9999);
			
			// MultiChatClient 프로그램 실행 시 대화명이 미입력 되었을때,
			// 사용법을 안내하는 메시지 출력
			if(args.length != 1) {
				System.out.println("프로그램 실행 시 대화명을 입력해 주세요!");
				System.out.println("실행 예 : java MultiChatClient 대화명");
			}
			
			// 메시지를 입력받아 서버로 보내는 작업(송신, 출력) : MultiChatSenderThread
			Thread st = new Ex03_MultiChatSenderThread(socket, args[0]);
			st.start();
			
			// 메시지를 수신받아 화면에 출력
			Thread rt = new Ex03_MultiChatReceiverThread(socket);
			rt.start();
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Client Exception!!!");
			System.out.println("종료되었습니다!");
		} /* finally {
			try {
				socket.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} */
	} // main()
} // class