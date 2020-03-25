import java.util.ArrayList;

public class Ex05_ArrayListMain05 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		
		list.add(new String("AAA"));
		list.add("BBB");
		list.add("CCC");
		System.out.println(list);
		
		list.add(1, "DDD");		// index 위치에 값이 저장되고, 기존 값은 뒤로 이동된다.
		System.out.println(list);
		
		list.set(1, "EEE");		// index 위치값이 수정
		System.out.println(list);
		
		list.remove(1);			// index 위치값이 삭제
		System.out.println(list);
		
		list.removeAll(list);	// list의 전체값이 삭제
		System.out.println(list);
	} // main()
} // class