public class Ex05_Sleep extends Thread {
	
	private int num;
	public Ex05_Sleep(int num) {
		this.num = num;
	}
	
	@Override
	public void run() {
		for(int i = 1; i<= 10; i++) {
			System.out.println(num + ", ");
			try {
				sleep(1000); // ´ÜÀ§ millis 1/1000ÃÊ
			} catch (InterruptedException e) {
				e.printStackTrace();
			} 
		}
	}
}