#include<Servo.h>
Servo myservo;

void setup() {
  myservo.attach(3);
  myservo.write(0); // 0 ~ 179까지 각도가 가능, 일단 0으로 초기화한다.
}

void loop() {
  int varRes = analogRead(A0); // 가변저항 값을 읽는다.
  int value = map(varRes, 0, 1023, 0, 179);

  myservo.write(value);
}
