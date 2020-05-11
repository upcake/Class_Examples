import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConn {	// SingleTon Class : 특정 역할 하나만 수행하는 클래스
	// 연결 객체 정의
	private static Connection conn;
	
	// 초기화 블럭(static 블럭) : 가장 먼저 메모리에 로딩 → 실행
	static {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB Connection Exception!!!");
		}
	}

	//getConn() 정의
	public static Connection getConn() {
		return conn;
	}
} // class