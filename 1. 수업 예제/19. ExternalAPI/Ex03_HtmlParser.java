import java.net.URL;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

public class Ex03_HtmlParser {
	public static void main(String[] args) {
		String address = "https://sum.su.or.kr:8888/bible/today";
		// https:// 프로토콜, www.naver.com 도메인, 전체를 url
		try {
			URL url = new URL(address);
			Source source = new Source(url);
//			System.out.println(source);
			List<Element> list = source.getAllElements(HTMLElementName.DIV);
			// getAllElements : 해당하는 HTML 요소를 모두 가져오는 list를 반환한다.
			// HTMLElementName.DIV : div 태그 안의 내용을 지정

			// list에 담긴 내용을 하나의 문자열에 넣음
			String html1 = null; // 제목(subject)
			String html2 = null; // 날짜(data)
			String html3 = null; // 소제목(strapline)
			String html4 = null; // 본문(content)
			
			for (int i = 0; i < list.size(); i++) {
				String data = list.get(i).getContent().toString();
//				System.out.println(data);
				
				// 제목 포함 데이터 가져오기
				if(data.contains("id=\"bible_text\">")) {
					html1 = data;
				}
				
				// 날짜 포함 데이터 가져오기
				if(data.contains("id=\"dailybible_info\">")) {
					html2 = data;
				}
				
				// 소제목 포함 데이터 가져오기
				if(data.contains("id=\"bibleinfo_box\">")) {
					html3 = data;
				}
				
				// 본문 포함 데이터 가져오기
				if(data.contains("id=\"body_list\">")) {
					html4 = data;
				}
			}
			// 맞게 가져왔는지 확인
//			System.out.println(html1);
//			System.out.println(html2);
//			System.out.println(html3);
//			System.out.println(html4);
			
			// 제목 가져오기
			// 제목 앞부분 제거
			int startPos = html1.indexOf("id=\"bible_text\">");
			String subject = html1.substring(startPos + 16);
//			System.out.println(subject);
			// 제목 뒷부분 제거
			int endPos = subject.indexOf("</div>");
			subject = subject.substring(0, endPos);
			System.out.println("제목 : " + subject.trim());
			
			// 날짜 가져오기
			// 날짜 앞부분 제거
			startPos = html2.indexOf("id=\"dailybible_info\">");
			String date = html2.substring(startPos + 21);
			// 날짜 뒷부분 제거
			endPos = date.indexOf("</div>");
			date = date.substring(0, endPos);
			System.out.println("날짜 : " + date.trim());
			
			// 소제목 가져오기
			// 소제목 앞부분 제거
			startPos = html3.indexOf("id=\"bibleinfo_box\">");
			String strapline = html3.substring(startPos + 19);
			// 소제목 뒷부분 제거
			endPos = strapline.indexOf("</div>");
			strapline = strapline.substring(0, endPos);
//			// 복음명 앞의 공백과 '본문 : ' 제거 
//			strapline = strapline.trim();
//			strapline = strapline.substring(5);
//			System.out.println("소제목 : " + strapline.trim());
			System.out.println(strapline.trim());
			
			// 본문 가져오기
			// 본문 앞부분 제거
			startPos = html4.indexOf("id=\"body_list\">");
			String content = html4.substring(startPos + 15);
//			System.out.println(content);
			// 본문 뒷부분 제거
			endPos = html4.indexOf("</ul>");
			content = content.substring(0, endPos);
//			System.out.println(content);
			
			// li 쪼개서 무한 배열에 담기
			String[] sp = content.split("</li>");
//			System.out.println(Arrays.toString(sp));
			// 숫자만 구하기
			for (int i = 0; i < sp.length - 1; i++) {
				// 숫자 앞부분 제거
				int numStartPos = sp[i].indexOf("class=\"num\">");
				String num = sp[i].substring(numStartPos + 12);
//				System.out.println(num);
				// 숫자 뒷부분 제거
				int numEndPos = num.indexOf("</div>");
				num = num.substring(0, numEndPos);
//				System.out.println(num);
				
				// 내용 앞부분 제거
				int infoStartPos = sp[i].indexOf("class=\"info\">");
				String info = sp[i].substring(infoStartPos + 13);
//				System.out.println(info);
				// 내용 뒷부분 제거
				int infoEndPos = info.indexOf("</div>");
				info = info.substring(0, infoEndPos);
				
				System.out.println(num + " : " + info.trim());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class