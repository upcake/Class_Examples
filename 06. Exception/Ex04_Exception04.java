public class Ex04_Exception04 {
	public static void main(String[] args) {
		// 1부터 100까지의 누적합(sum)을 구하시오.
		// 단, 누적합이 777 이상이 되면, 반복을 중지(break)하고 그때까지의 결과 값을 출력
		int sum = 0, cnt = 0;
		for(int i = 1; i < 101; i++) {
			sum += i;
			cnt++;
			if(sum >= 777) {
				System.out.println("누적 합이 777 이상이 되었습니다!");
				break;
			} // if
		} // for
		System.out.println(sum);
		System.out.println(cnt);
		
		//단, try ~~ catch 블록을 이용하여 예외처리 하시오 : throw
		sum = 0;
		cnt = 0;
		try {
			for(int i = 1; i < 101; i++) {
				sum += i;
				cnt++;
				if(sum >= 777) {
					throw new Exception("누적 합이 777 이상이 되었습니다!");
					// 예외를 강제로 발생시켜 catch 블록으로 던짐
				} // if
			} // for
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println(e.getMessage());
		} // try
		System.out.println(sum);
		System.out.println(cnt);
	} // main()
} // class

// throw : 강제로 예외를 발생시킨다 → catch 블럭으로 예의를 던질때 사용, 잘 안쓴다