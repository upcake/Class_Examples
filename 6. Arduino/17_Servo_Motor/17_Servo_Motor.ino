#include<Servo.h>
Servo myservo;

void setup() {
  myservo.attach(3);
  myservo.write(0); // 0 ~ 179까지 각도가 가능, 일단 0으로 초기화한다.
}

void loop() {
 for(int i = 0; i <= 179; i++) {  // 모터를 179도까지 회전시킨다.
  myservo.write(i);
  delay(10); 
 }

 for(int i = 179; i >= 0; i--) {  // 모터를 0도까지 회전시킨다.
  myservo.write(i);
  delay(10);
 }
}
