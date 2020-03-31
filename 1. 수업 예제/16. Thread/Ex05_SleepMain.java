public class Ex05_SleepMain {
	public static void main(String[] args) {
		Ex05_Sleep sleep1 = new Ex05_Sleep(1);
		Ex05_Sleep sleep2 = new Ex05_Sleep(2);
		Ex05_Sleep sleep3 = new Ex05_Sleep(3);
		
		sleep1.start();
		sleep2.start();
		sleep3.start();
	} // main()
} // class