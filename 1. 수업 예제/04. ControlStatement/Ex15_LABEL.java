public class Ex15_LABEL {
	public static void main(String[] args) {
		LABEL:
		for(char upper = 'A'; upper <= 'Z'; upper++) {
			for(char lower = 'a'; lower <= 'z'; lower++){
					System.out.println(upper + "-" + lower);
					if(lower == 'g') {
						break LABEL;	// 전체 조건문을 빠져나가고자 할때 LABEL을 사용한다.
					} // if
			} // for
		} // for
	} // main()
} // class