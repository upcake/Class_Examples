import java.text.DecimalFormat;

public class Ex02_Student {
	// 멤버변수 선언
	String name;
	int kor, eng, mat, sum;
	float avg;
	
	// 총점을 계산하는 멤버메소드 정의
	public void getSum() {
		sum = kor + eng + mat;
		
	} // getSum()
	
	// 평균을 계산하는 멤버메소드 정의
	public void getavg() {
		avg = (float) sum / 3;
	} // getAvg()
	
	// 결과를 출력하는 멤버메소드 정의
	public void display() {
		System.out.println("이름 : " + name);
		System.out.println("국어 : " + kor);
		System.out.println("영어 : " + eng);
		System.out.println("수학 : " + mat);
		System.out.println("총점 : " + sum);
		DecimalFormat df = new DecimalFormat("0.00");
		System.out.println("평균 : " + df.format(avg));
		System.out.println("===========");
	} // display()
} // class