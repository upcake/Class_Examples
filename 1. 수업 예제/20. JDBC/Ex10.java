import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex10 {
	public static void main(String[] args) {
		// 나이(age)가 30세 이상인 회원의 목록 출력
		// : select ~~ where ~~ ▶ executeQuery() ▶ ResultSet
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			// 전송 객체 생성 시 레코드의 개수를 파악하기 위한 매개 변수를 입력
			Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
//			String sql = "select * from tblMember where age >= 30";
			int age = 30;
			String sql = "select * from tblMember where age >=" + age;
			
			ResultSet rs = st.executeQuery(sql);
			
			// ResultSet(결과 객체)의 레코드 개수 구하기
			rs.last(); // 포인터를 마지막으로 이동
			int rowCount = rs.getRow(); // 마지막 행 번호를 가져온다
//			System.out.println(rowCount);
			
			/* if문 사용시 단 하나의 결과만 나온다.
			if(rs.next() == true) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
			} else {
				System.out.println("검색 결과가 없습니다.");
			}
			*/
			if(rowCount > 0) {	// 검색 결과가 있다
				rs.beforeFirst(); // 포인터를 맨 처음 이전으로 이동
				while(rs.next()) {
					int num = rs.getInt("num");
					String name = rs.getString("name");
					age = rs.getInt("age");
					String addr = rs.getString("addr");
					String tel = rs.getString("tel");
					System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
				} // while
			} else {
				System.out.println("검색 결과가 없습니다.");
			} // if else
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class 