import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Test09 {
	public static void main(String[] args) {
		// 번호(num)가 1번인 회원(홍길동)의 나이(age)를 29로 변경,
		// 전화번호(tel)를 010-1111-1111로 변경
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			Statement st = conn.createStatement();
			
			int num = 1;
			int age = 29;
			String tel = "010-1111-1111";
			
//			String sql = "update tblMember set age = 29, tel = '010-1111-1111' where num = 1";
			String sql = "update tblMember set age = " + age + " , tel = '" + tel + "' where num = " + num;
					
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