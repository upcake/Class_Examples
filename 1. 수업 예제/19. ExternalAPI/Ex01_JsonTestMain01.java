import java.io.BufferedWriter;
import java.io.FileWriter;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Ex01_JsonTestMain01 {
	public static void main(String[] args) {
		Ex01_JsonDTO dto1 = new Ex01_JsonDTO(10, "홍길동", 33, "광주시 서구 농성동", "010-1111-1111");
		Ex01_JsonDTO dto2 = new Ex01_JsonDTO(20, "박문수", 30, "광주시 남구 봉선동", "010-2222-2222");
		Ex01_JsonDTO dto3 = new Ex01_JsonDTO(30, "이순신", 50, "광주시 북구 용봉동", "010-3333-3333");
		// 10, 홍길동, 등등 - json value
		// dto1 : json object
		// [dto1, dto2, dto3] : json array 
		
		JSONArray array = new JSONArray();		// JSON Array 객체 생성
		JSONObject object = new JSONObject();	// JSON Object 객체 생성
		
		object.put("member", dto1);	// DTO 객체를 JSON Object 객체로 변환
		array.add(object);	// JSON Obejct를 JSON Array에 등록
		
		object.put("member", dto2);
		array.add(object);

		object.put("member", dto3);
		array.add(object);
		
		String json = array.toString();	// JSON 형식의 내용을 화면에 출력
		System.out.println(json);
		
		//결과를 화면에 출력
		for (int i = 0; i < array.size(); i++) {		// array는 무한배열이기 때문에 length가 아닌 size 사용
			JSONObject obj = array.getJSONObject(i);	// {"member" :  {addr : 10 ~~~
			obj = obj.getJSONObject("member");			// {addr : 10 ~~~
			Ex01_JsonDTO dto = (Ex01_JsonDTO) JSONObject.toBean(obj, Ex01_JsonDTO.class);	// 갖고온 JSON Object를 자바 객체로 만들어줌
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		
		//결과를 파일로 저장
		try {
			FileWriter fw = new FileWriter("member.json");	// 한글이 들어가므로 FileWriter 사용
			BufferedWriter bw = new BufferedWriter(fw);		// 한글이 들어가므로 BufferedWriter 사용
			bw.write(json);
			bw.flush();
			bw.close();
			fw.close();
			System.out.println("member.json 파일이 생성되었습니다.");
			// json 파일을 열어서 Ctrl + Shift + f를 누르면 자동으로 들여쓰기 해준다.
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class