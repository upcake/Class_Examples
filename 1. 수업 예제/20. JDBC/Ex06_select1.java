import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex06_select1 {
	public static void main(String[] args) {
		// 번호가 1번인 회원의 정보를 출력하시오 : 조건 검색(select ~~ where ~~)
		// 특정 레코드만 출력하고자 할 경우에는 if문을 사용한다.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			Statement st = conn.createStatement();
			String sql = "select * from tblMember where num = 1";
			ResultSet rs = st.executeQuery(sql);
			
			if(rs.next() == true) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class