public class Ex12_gugudan {
	public static void main(String[] args) {
		for(int i = 2; i <= 9; i++) {
			for(int j = 1; j <= 9; j++) {
				if(i * j < 10) {
					System.out.print(i + " X " + j + " = 0" + i*j + "\t");
				} else{
					System.out.print(i + " X " + j + " = " + i*j + "\t");
				} // if
			} // for j
			System.out.println();
		} // for i
		System.out.println("========================================");

		for(int i = 1; i <= 9; i++) {
			for(int j = 2; j <= 9; j++) {
				if(i * j < 10) {
					System.out.print(j + " X " + i + " = 0" + j*i + "\t");
				} else {
					System.out.print(j + " X " + i + " = " + j*i + "\t");
				}
			} // for j
			System.out.println();
		} // for i
	} // main()
} // class