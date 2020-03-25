import java.util.ArrayList;

public class Ex04_ArrayListMain04 {
	public static void main(String[] args) {
		//ArrayList<> list에 정수 10, 20, 30, 40, 50을 저장(add())하고 출력(get())
		ArrayList<Integer> list = new ArrayList<>();
		
		// 단순 for문 출력
		for(int i = 1; i <= 5; i++) {
			list.add(i * 10);
		}
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list[" + i + "] : " + list.get(i));
		}

		// 향상된 for문 출력
		for (Integer integer : list) {
			System.out.println(integer);
		}

		// Boxing된 list 출력
		System.out.println(list);
	} // main()
} // class