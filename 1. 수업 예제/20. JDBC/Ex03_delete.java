import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex03_delete {
	public static void main(String[] args) {
		// 번호(num)가 5번인 회원(지선우)를 삭제하시오. : delete
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			Statement st = conn.createStatement();
			
			String sql = "delete from tblMember where num = 5";
			
			int succ = st.executeUpdate(sql);
			System.out.println("succ : " + succ);
			
			if(succ > 0) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패"); // 연달아 실행한다면, 삭제할 데이터가 없기 때문에 삭제 실패가 나온다.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class