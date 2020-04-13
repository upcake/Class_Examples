import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex04_update {
	public static void main(String[] args) {
		// 번호(num)가 1번인 회원(홍길동)의 나이 (age)를 31로 변경,
		// 전화 번호(tel)를 010-9876-1234로 변경
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			Statement st = conn.createStatement();
			
			String sql = "update tblMember set age = 31, tel = '010-9876-1234' "; // 한 문장을 두 라인에 쓸 때 띄어쓰기를 반드시 주의한다.
			sql += "where num = 1";
			
			int succ = st.executeUpdate(sql);
			if (succ > 0) {
				System.out.println("갱신 성공");
			} else {
				System.out.println("갱신 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class