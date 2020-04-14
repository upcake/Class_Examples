import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

// ★ PreparedStatement 객체를 활용 
// ① JDBC Driver 정적 로딩 : opjdbc6.jar
// ② JDBC API import → 자동 생성


public class Ex11_PreparedStatement {
	public static void main(String[] args) {
		try {
			// ③ JDBC Driver Loading (동적 로딩)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// ④ Connection 객체 (연결 객체)
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			// ⑤ SQL 문장 작성
			String sql = "insert into tblMember values(?, ?, ?, ?, ?)";
			
			// ⑥ PreparedStatement 객체 생성
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 5);
			ps.setString(2, "지선우");
			ps.setInt(3, 40);
			ps.setString(4, "서울시 강남구 청담동");
			ps.setString(5, "010-5555-5555");
			
			// ⑦ PreparedStatement 객체 전송(실행)
			int succ = ps.executeUpdate();
			if(succ > 0) {
				System.out.println("삽입 성공");
			} else {
				System.out.println("삽입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class