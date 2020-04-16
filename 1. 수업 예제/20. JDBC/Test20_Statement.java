import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

/*
[tblMember Table]
num	name	age	addr			tel
1	홍길동	29	광주시 서구 농성동		010-1234-5678
2	박문수	25	광주시 남구 봉선동		010-5555-6666
3	이몽룡	25	광주시 동구 서석동		010-9999-8888
4	홍길순	35	광주시 북구 용봉동		010-7788-7788
5	성춘향	33	광주시 광산구 평동		010-8888-7788

[처리 조건]
- tblMember Table의 내용을 위와 같이 입력(수정)한다.
- 검색할 전화번호의 일부를 입력 받는다.
- 입력 받은 전화번호를 이용하여 tblMember 테이블과 연동하여,
	전화번호를 검색하여 출력한다.
	
[결과 화면]
검색할 전화번호를 입력하세요 : 7788
4	홍길순	35	광주시 북구 용봉동		010-7788-7788
5	성춘향	33	광주시 광산구 평동		010-8888-7788

[Hint]
- Scanner 활용, 입력 변수를 이용한 SQL 작성, Like 연산자를 활용
- String sql = "select * from tblMember where tel like '%' + searchTel + '%'";
- 전송 객체는 Statement 객체를 활용
*/
public class Test20_Statement {
	public static void main(String[] args) {
		try {
			// 0. DB에 접속
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
			// 1. 현재 테이블을 삭제
			Statement st = conn.createStatement();
			String sql = "delete from tblMember";
			int succ = st.executeUpdate(sql);
			if (succ > 0) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
			
			// 2. 테이블 작성
			sql = "insert into tblMember values (1, '홍길동', 29, '광주시 서구 농성동', '010-1234-5678')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (2, '박문수', 25, '광주시 남구 봉선동', '010-5555-6666')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (3, '이몽룡', 29, '광주시 동구 서석동', '010-9999-8888')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (4, '홍길순', 35, '광주시 북구 용봉동', '010-7788-7788')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (5, '성춘향', 33, '광주시 광산구 평동', '010-8888-7788')";
			succ = st.executeUpdate(sql);
			if (succ > 0) {
				System.out.println("삽입 성공");
			} else {
				System.out.println("삽입 실패");
			}
			
			// 3. 검색할 전화번호를 입력받는다.
			Scanner scanner = new Scanner(System.in);
			System.out.print("검색할 전화번호를 입력하세요> ");
			String searchTel = scanner.nextLine();
			scanner.close();
			
			// 4. 입력받은 전화번호로 테이블을 검색하고 출력한다.
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from tblMember where tel like '%" + searchTel + "%'";
			ResultSet rs = st.executeQuery(sql);
			
			rs.last();
			int rowCount = rs.getRow();
			
			if(rowCount > 0) {
				rs.beforeFirst();
				while(rs.next()) {
					int num = rs.getInt("num");
					String name = rs.getString("name");
					int age = rs.getInt("age");
					String addr = rs.getString("addr");
					String tel = rs.getString("tel");
					System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
				}
			} else {
				System.out.println("검색 결과가 없ㅅ브니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class