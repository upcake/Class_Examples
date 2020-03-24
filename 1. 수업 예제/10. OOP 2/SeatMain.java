import com.hanul.seat.SeatDAO;
import com.hanul.seat.SeatDTO;

public class SeatMain {
/*
 - 멤버 변수 선언
 모둠(1 ~ 8)	성별		이름	
 int		char		String	
 */
	public static void main(String[] args) {
		// 참여원들의 배열을 선언하고 초기화
		SeatDTO[] seat = new SeatDTO[16];
		seat[0] = new SeatDTO(1, 'M', "학생1");
		seat[1] = new SeatDTO(1, 'F', "학생2");
		seat[2] = new SeatDTO(1, 'F', "학생3");
		
		seat[3] = new SeatDTO(2, 'F', "학생4");
		
		seat[4] = new SeatDTO(3, 'F', "학생5");
		seat[5] = new SeatDTO(3, 'M', "학생6");
		seat[6] = new SeatDTO(3, 'F', "학생7");
		
		seat[7] = new SeatDTO(4, 'M', "학생8");
		seat[8] = new SeatDTO(4, 'M', "학생9");
				
		seat[9] = new SeatDTO(5, 'F', "학생10");
		seat[10] = new SeatDTO(5, 'F', "학생11");
		
		seat[11] = new SeatDTO(6, 'M', "학생12");
		seat[12] = new SeatDTO(6, 'M', "학생13");
		
		seat[13] = new SeatDTO(7, 'M', "학생14");
		seat[14] = new SeatDTO(7, 'M', "학생15");
		
		seat[15] = new SeatDTO(8, 'M', "학생16");
		
		// DAO의 메소드 호출
		// 같은 모둠에 앉은 사람들끼리는 같은 테이블에 배치 안됨
		// 남남남남, 여여여여 성별 쏠림 안됨
		SeatDAO dao = new SeatDAO(seat);
		dao.divStudent();
		dao.display();
	} // main()
} // class