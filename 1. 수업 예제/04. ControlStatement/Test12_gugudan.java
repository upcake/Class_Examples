public class Test12_gugudan {
	public static void main(String[] args) {
		// for, while, do~while을 이용하여 구구단을 출력하는 프로그램을 완성하시오.
		// ① for
		System.out.println("for 가로");
		for(int i = 2; i <= 9; i++) {
			for(int j = 1; j <= 9; j++){
				if(i * j < 10) {
					System.out.print(i + " X " + j + " = 0" + i*j + "\t");
				} else {
					System.out.print(i + " X " + j + " = " + i*j + "\t");
				} // if
			} // for j
			System.out.println();
		} // for i
		System.out.println();
		
		System.out.println("for 세로");
		for(int i = 1; i <= 9; i++) {
			for(int j = 2; j <= 9; j++) {
				if(i * j < 10) {
					System.out.print(j + " X " + i + " = 0" + i*j + "\t");
				} else {
					System.out.print(j + " X " + i + " = " + i*j + "\t");
				} // if
			} // for j
			System.out.println();
		} // for i
		System.out.println("========================================");
		
		// ② while
		System.out.println("while 가로");
		int i = 2;
		int j = 1;
		
		while(true) {
			if(i > 9) {
				break;
			} if((i * j < 10) && (j <= 9)) {
				System.out.print(i + " X " + j + " = 0" + i*j + "\t");
				j++;
			} else if((i * j >= 10) && (j <= 9)) {
				System.out.print(i + " X " + j + " = " + i*j + "\t");
				j++;
			} else {
				j = 1;
				i++;
				System.out.println();
			} // if
		} // while
		System.out.println();
		
		System.out.println("while 세로");
		i = 1;
		j = 2;
		
		while(true) {
			if(i > 9) {
				break;
			} if((i * j < 10) && (j <= 9)) {
				System.out.print(j + " X " + i + " = 0" + i*j + "\t");
				j++;
			} else if((i * j >= 10) && (j <= 9)) {
				System.out.print(j + " X " + i + " = " + i*j + "\t");
				j++;
			} else {
				j = 2;
				i++;
				System.out.println();
			} // if
		} // while
		System.out.println("========================================");
		
		// ③ do~while
		System.out.println("do~while 가로");
		i = 2;
		j = 1;
		
		do {
			if((i * j < 10) && (j <= 9)) {
				System.out.print(i + " X " + j + " = 0" + i*j + "\t");
				j++;
			} else if((i * j >= 10) && (j <= 9)) {
				System.out.print(i + " X " + j + " = " + i*j + "\t");
				j++;
			} else {
				j = 1;
				i++;
				System.out.println();
			} // if
		} while(i < 10);
		System.out.println();
		
		System.out.println("do~while 세로");
		i = 1;
		j = 2;
		
		do {
			if((i * j < 10) && (j <= 9)) {
				System.out.print(j + " X " + i + " = 0" + i*j + "\t");
				j++;
			} else if((i * j >= 10) && (j <= 9)) {
				System.out.print(j + " X " + i + " = " + i*j + "\t");
				j++;
			} else {
				j = 2;
				i++;
				System.out.println();
			} // if
		} while(i < 10);
	} // main()
} // class