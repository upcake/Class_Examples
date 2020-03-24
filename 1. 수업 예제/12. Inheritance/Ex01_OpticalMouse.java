public class Ex01_OpticalMouse extends Ex01_WheelMouse {
	// 상위 클래스인 Ex01_WheelMouse Class를 하위 클래스인 Ex01_OpticalMouse Class가 상속받았다.
	// 오버라이드(Override) : 자식 클래스에서 부모 클래스로부터 상속 받은 메소드를 재정의
	
	// 방법 1. 하드 코딩 후 @Override Annotation붙이기
	@Override
	public void clickLeft() {
		System.out.println("광마우스 왼쪽 버튼 클릭");
	}

	// 방법 2. Source - Override/Implement Methods 후 수정
	@Override
	public void clickRight() {
		System.out.println("광마우스 오른쪽 버튼 클릭");
	}
	
	// 방법 3. 자동 완성 기능(Ctrl + Space) 사용 후 수정
	@Override
	public void scroll() {
		System.out.println("광마우스 스크롤 기능");
	}
	
} // class