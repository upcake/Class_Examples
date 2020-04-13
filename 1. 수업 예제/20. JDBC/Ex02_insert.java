// ① JDBC API import → 자동 생성
// ② JDBC Driver 정적 로딩 : ojdbc6.jar
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex02_insert {
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
			
			// ⑤ Statement 전송 객체
			Statement st = conn.createStatement();
			
			// ⑥ SQL 문장 작성
			String sql = "insert into tblMember values";
			sql += "(5, '지선우', 40, '서울시 강남구 청담동', '010-5555-5555')";
			// SQL 문장 마지막에 ; 찍지 않는다.
			
			// ⑦ Statement 객체에 SQL 문장을 전송
			int succ = st.executeUpdate(sql);
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