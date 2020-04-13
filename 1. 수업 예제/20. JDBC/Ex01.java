import java.sql.Connection;
import java.sql.DriverManager;

public class Ex01 {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class