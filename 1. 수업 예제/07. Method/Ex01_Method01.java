public class Ex01_Method01 {
	//getSum() 메소드에 10과 20을 매개 변수로 보내는 호출문 작성
	public static void main(String[] args) {
		int a = 10, b = 20;		// getSum() 메소드로 보낼 매개 변수를 초기화
		getSum(a, b);			// getSum() 메소드를 호출문 ▶ 실인수
	} // main()
	
	// 2개의 정수를 매개 변수로 받아 합(sum)을 구하여 출력하는 메소드(getSum())를 정의
	public static void getSum(int a, int b) {	// getSum() 메소드를 정의 ▶ 가인수
		int sum = a + b;
		System.out.println("첫 번째 인수 : " + a);
		System.out.println("두 번째 인수 : " + b);
		System.out.println("두 인수의 합 : " + sum);
	} // getSum()
} // class

/*
★ Method(메소드)
	- 클래스가 가지고 있는 해위정보를 표현하는 것(동작, 기능) → 함수(Function)
	- 동작(행위)을 만들어 놓고 필요할 때 사용하기 위해서 호출(Calling)
	- 캡슐화의 원칙 : 클래스안에 메소드를 구현, 하나의 클래스 안에는 여러 개의 메소드가 존재
	
※ 클래스 안에는 무엇이 들어가는가?
	- 상태 정보 : 멤버 변수(필드) ▶ DTO Class, VO Class (Data Transfer Object), (Value Object)
	- 행위 정보 : 멤버 메소드 ▶ DAO Class (Data Access Object)
	- main() : 자바는 반드시 main() 메소드에서 프로그램이 실행(동작) ▶ Main Class

★ 메소드의 형식(메소드를 만드는 방법)
  ①		 ②		③	  ④		(	⑤	)
public static void getSum(int a, int b) {		▶ 프로토 타입 : 머리, 정의 ,선언
	~메소드 동작 구현~								▶ 바디 : 구현부
	⑥ return;
}

① 접근제어자 : public(접근 허용), private(정보 은닉 : 내부만 허용), protected, default
② 한정자 : static(자동으로 메모리에 생성), 생략(객체를 생성해서 접근), final(재정의가 불가)
③ 리턴 타입(반환값) : 메소드가 동작 후에 최종적으로 만들어 내는 결과 값의 데이터 타입
	- 리턴을 하지 않는 경우 : void ▶ 메소드 내부에 return문이 없다.
	- 리턴을 하는 경우 : 리턴되는 데이터 타입 ▶ 메소드 내부에 return문이 있다.
④ 메소드 이름 : 소문자로 시작, 키워드는 사용 불가, 의미있게 작성, 변수명 작성 규칙과 동일
⑤ 매개 변수 리스트 : 메소드가 동작하기 위해서 외부로부터 입력되는 데이터 ▶ 인수, 인자, parameter
⑥ return문 : 메소드가 동작을 완료한 후, 결과 값을 호출한 쪽으로 넘기는 행위

★ 실인수(호출)와 가인수(정의)의 매개 변수 전달 규칙 : Parameter Passing Rule
	- 실인수와 가인수의 매개 변수의 개수가 같아야 한다.
	- 실인수와 가인수의 데이터 타입이 같아야 한다.
	- 실인수와 가인수의 이름은 같아도 되고 달라도 된다.
*/