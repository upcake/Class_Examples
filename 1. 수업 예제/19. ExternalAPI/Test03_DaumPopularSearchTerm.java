import java.net.URL;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

public class Test03_DaumPopularSearchTerm {
	public static void main(String[] args) {
		// 주소 가져오기
		String address = "https://www.daum.net/";
		try {
			URL url = new URL(address);
			Source source = new Source(url);
//			System.out.println(source);
			// 주소의 소스를 list에 넣음
			List<Element> list = source.getAllElements(HTMLElementName.LI);
//			System.out.println(list);
			
			// list의 내용을 문자열에 넣음
			String html1 = null;
			
			for (int i = 0; i < list.size(); i++) {
				String data = list.get(i).getContent().toString();
//				System.out.println(data);
				
				// 인기 검색어 데이터 가져오기
				if(data.contains("link_favorsch")) {
					html1 = data;
					int startPos = html1.indexOf(">");
					int endPos = html1.indexOf("</a>");
//					System.out.println(html1);
					String subject = html1.substring(startPos + 1, endPos);
					System.out.println((i + 1) + "위 : " + subject);
				} // if
			} // for
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class