import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.hanul.study.MemberDTO;

public class Ex16 {
	// 객체(상태 정보)를 byte 형으로 변환하여 입출력하는 스트림
	// ObjectInputStream, ObjectOutputStream
	// 객체의 직렬화 : 객체가 가지고 있는 멤버 변수들이 바이트형으로 바뀌는 것
	// 객체의 역직렬화 : 직렬화된 객체가 다시 원래의 상태로 복원되는 것
	// 객체 구현(DTO Class 설계) : implements Serializable ▶ 객체의 직렬화
	public static void main(String[] args) {
		MemberDTO dto = new MemberDTO();
		dto.setNum(777);
		dto.setName("한울");
		dto.setAge(26);
		dto.setAddr("광주시 서구 농성동");
		dto.setTel("062-362-7797");
//		MemberDTO dto = new MemberDTO(777, "한울", 26, "광주시", "062");
		
		// 위의 회원 1명의 정보를 파일에 저장하시오 : member.ser
		try {
			FileOutputStream fos = new FileOutputStream("member.ser");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(dto);	// 객체를 직렬화 해둬야 에러가 안남
			oos.close();
			fos.close();
			System.out.println("member.ser 파일이 생성되었습니다.");
			
			// member.ser 파일의 내용을 읽어서 출력하시오.
			FileInputStream fis = new FileInputStream("member.ser");
			ObjectInputStream ois = new ObjectInputStream(fis);
			dto = (MemberDTO) ois.readObject();	// 객체의 역직렬화
			ois.close();
			fis.close();
			
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class