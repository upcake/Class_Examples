import com.hanul.poly03.Ex03_Radio;
import com.hanul.poly03.Ex03_RemoCon;
import com.hanul.poly03.Ex03_TV;

public class Ex03_Poly03Main01 {
	//RemoCon Interface로 TV, Radio 소리를 올리고 내린 후 인터넷 접속
	public static void main(String[] args) {
		// ① UpCasting
		Ex03_RemoCon remoCon = new Ex03_TV();
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
		
		remoCon = new Ex03_Radio();
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
		
		System.out.println("===============================");
		
		Ex03_TV tv = new Ex03_TV();
		Ex03_Radio radio = new Ex03_Radio();
		
		// ② 다형성 인수
		play(tv);
		play(radio);
		
		System.out.println("===============================");

		// ③ 다형성 배열
		Ex03_RemoCon[] remoCons = {tv, radio};
		for (int i = 0; i < remoCons.length; i++) {
			remoCons[i].volUp();
			remoCons[i].volDown();
			remoCons[i].internet();
		}
	} // main()

	public static void play(Ex03_RemoCon remoCon) {
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
	} // play()
} // class