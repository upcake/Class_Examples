package sec04;

public class Ex04_QStopExample {
	public static void main(String[] args) throws Exception {
		int keyCode;
		
		while(true) {
			keyCode = System.in.read();
			System.out.println("keyCode : " + keyCode);
			if(keyCode == 113) {
				break;
			} // if
		} // while
		
		System.out.println("Á¾·á");
	} // main()
} // class