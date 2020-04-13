import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex07 {
	public static void main(String[] args) {
		// JAVA에서 입력 변수를 이용한 JDBC 활용
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			Statement st = conn.createStatement();
			
			int num = 5;
			String name = "지선우";
			int age = 40;
			String addr = "서울시 강남구 청담동";
			String tel = "010-5555-5555";
			
//			String sql = "insert into tblMember values";
//			sql += "(5, '지선우', 40, '서울시 강남구 청담동', '010-5555-5555')";
			
//			String sql = "insert into tblMember values"; 
//			sql += "(num, 'name', age, 'addr', 'tel')"; // 변수 명이 문자열로 인식되서 예외 발생
			
			String sql = "insert into tblMember values";
			sql += "("+num+", '"+name+"', "+age+", '"+addr+"', '"+tel+"')"; // 변수 명 앞에 "+, 뒤에 +" 적어준다.
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