public class Ex01_MouseMain {
	public static void main(String[] args) {
		System.out.println("Mouse Class");
		Ex01_Mouse m = new Ex01_Mouse();	// Ex01_Mouse 객체 생성
		m.clickLeft();
		m.clickRight();
		System.out.println("============");
		
		System.out.println("WheelMouse Class");
		Ex01_WheelMouse wm = new Ex01_WheelMouse();	// Ex01_WheelMouse 객체 생성
		wm.clickLeft();		// 상속 받은 상위 클래스(Ex01_Mouse)의 메소드
		wm.clickRight();	// 상속 받은 상위 클래스(Ex01_Mouse)의 메소드
		wm.scroll();		// 하위 클래스(Ex01_WheelMouse)의 메소드
		System.out.println("============");
		
		System.out.println("OpticalMouse Class");
		Ex01_OpticalMouse om = new Ex01_OpticalMouse();	// Ex01_OpticalMouse 객체 생성
		om.clickLeft();
		om.clickRight();
		om.scroll();
	} // main()
} // class