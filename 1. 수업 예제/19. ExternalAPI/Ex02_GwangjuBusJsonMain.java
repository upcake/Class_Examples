import java.io.BufferedReader;
import java.io.FileReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class Ex02_GwangjuBusJsonMain {
	public static void main(String[] args) {
		String jsonData = getJsonData();
//		System.out.println(jsonData);
		try {
			JSONArray array = JSONArray.fromObject(jsonData);
			// 순수 JSONObject인 jsonData를 바로 JSONArray로 만든다
			for (Object object : array) {	// 타입을 모를때는 Object를 사용한다.
				JSONObject obj = (JSONObject) JSONSerializer.toJSON(object);
				// 타입을 정확히 알 수 없는 object를 foreach문에 사용하기 위해 JSONSerializer를 사용해서 JSON형식으로 바꿔준다.
				System.out.print("노선 이름 : " + obj.get("LINE_NAME") + "\t");
				System.out.print("출발지 : " + obj.get("DIR_UP_NAME") + "\t");
				System.out.print("도착지 : " + obj.get("DIR_DOWN_NAME") + "\n\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
	
	// gjbus.json 파일의 내용을 읽어서, JSON 구조 형태로 만들어 준다.
	public static String getJsonData() {
		String json = null;
		String jsonData = "";
		try {
			FileReader fr = new FileReader("gjbus.json");
			BufferedReader br = new BufferedReader(fr);
			while (true) {
				json = br.readLine();
				if(json == null) {	// json에 더 읽을 것이 없으면 빠져나가라
					break;
				} else {
					jsonData += json;	// 읽을 데이터가 있으면 jsonData에 담아라
				} // if else
			} // while
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
		return jsonData;
	} // getJsonData()
} // class