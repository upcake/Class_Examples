package com.hanul.finalanimal;

public class Ex04_Final_Action {
	public void action(Ex04_Final_Animal animal) {	// 다형성 인수
		animal.cry();
		
		if(animal instanceof Ex04_Final_Dog) {		// 객체 타입 비교
			((Ex04_Final_Dog)animal).run();			// 다운 캐스팅
		} else if(animal instanceof Ex04_Final_Cat) {
			((Ex04_Final_Cat)animal).grooming();
		} else if(animal instanceof Ex04_Final_Tiger) {
			((Ex04_Final_Tiger)animal).hunter();
		} else if(animal instanceof Ex04_Final_Duck) {
			((Ex04_Final_Duck)animal).fly();
		}
	}

}
