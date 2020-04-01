import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex15 {
	// 현재까지의 게임정보(상태)를 암호화하여 game.data 파일에 저장
	// 암호화 : 기본 데이터 타입, String 타입을 강제로 byte 형의 자료로 변환
	public static void main(String[] args) {
		try {
			String id = "hanul";
			String user = "한울";
			int level = 5;
			int money = 123450;
			double score = 4567.89;
			
			FileOutputStream fos = new FileOutputStream("game.data");
			DataOutputStream dos = new DataOutputStream(fos);
			
			dos.writeUTF(id);
			dos.writeUTF(user);
			dos.writeInt(level);
			dos.writeInt(money);
			dos.writeDouble(score);
			
			dos.close();
			fos.close();
			System.out.println("game.data 파일이 생성되었습니다.");
			
			FileInputStream fis = new FileInputStream("game.data");
			DataInputStream dis = new DataInputStream(fis);
			
			String i = dis.readUTF();
			String u = dis.readUTF();
			int l = dis.readInt();
			int m = dis.readInt();
			double s = dis.readDouble();
			
			dis.close();
			fis.close();
			
			System.out.println("id : " + i);
			System.out.println("user : " + u);
			System.out.println("level : " + l);
			System.out.println("money : " + m);
			System.out.println("score : " + s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class