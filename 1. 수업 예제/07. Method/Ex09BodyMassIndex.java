import java.text.DecimalFormat;
import java.util.Scanner;

public class Ex09BodyMassIndex {
	public static void main(String[] args) {
		// 신장(height)과 체중(weight)을 입력(예 : 175.5, 65.5)
		Scanner scanner = new Scanner(System.in);
		System.out.print("신장을 입력하세요(입력 예 : 175.5) ▶ ");
		float height = Float.parseFloat(scanner.nextLine());
		System.out.print("체중을 입력하세요 (입력 예 : 65.5) ▶ ");
		float weight = Float.parseFloat(scanner.nextLine());
		scanner.close();
		
		// 결과를 출력
		Ex09BodyMassIndex bmi = new Ex09BodyMassIndex();
		System.out.println("입력하신 신장은 " + height + "Cm 입니다.");
		System.out.println("입력하신 체중은 " + weight + "kg 입니다.");
		System.out.println("비만 지수(카우프 지수)는 " + bmi.bmiCalc(height, weight) + "입니다.");
		System.out.println("건강 상태는 " + bmi.getResult(Float.parseFloat(bmi.bmiCalc(height, weight))) + "입니다.");
	} // main()
	
	// 비만 지수(카우프 지수)를 구하는 메소드(bmiCalc())를 정의(소수 둘 째 자리까지 표시)
	public String bmiCalc(float height, float weight) {
		float hh = (height / 100) * (height / 100);	// 신장의 제곱
		float result = weight / hh;					// bmi 지수 계산
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(result);
	} // bmiCalc()
	
	// 비만 지수를 기준으로 건강 상태를 구하는 메소드(getResult())를 정의
	public String getResult(float index) {
		String result = null;	// 최종 결과(건강 상태)를 저장할 문자열 변수를 초기화
		if(index >= 35) {
			result = "고도 비만";
		} else if(index >= 30) {
			result = "비만";
		} else if(index >= 25) {
			result = "과체중"; 
		} else if(index >= 20) {
			result = "정상";
		} else {
			result = "저체중";
		} // if else if else
		return result;
	} // getResult()
} // class