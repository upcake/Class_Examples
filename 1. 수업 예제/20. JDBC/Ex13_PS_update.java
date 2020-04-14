import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Ex13_PS_update {
	public static void main(String[] args) {
		// 번호(num)가 1번인 회원(홍길동)의 나이(age)를 31로 변경,
		// 전화번호(tel)룰 010-1111-1111로 변경
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			String sql = "update tblMember set age = ?, tel = ? where num = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 31);	// 물음표 순서 번호가 앞에 오고 입력할 값이 뒤에 온다.
			ps.setString(2, "010-9876-1234");
			ps.setInt(3, 1);
			
			int succ = ps.executeUpdate();
			if(succ > 0) {
				System.out.println("갱신 성공");
			} else {
				System.out.println("갱신 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class