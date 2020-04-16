import com.hanul.member.MemberDAO;

public class Ex18_PS_DAO_DTO_select_1 {
	public static void main(String[] args) {
		// 전체 회원 목록을 검색 후 출력 : memberSearchAll() 호출
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAll1();
	} // main()
} // class