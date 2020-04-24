#include<Servo.h>
Servo myservo;

int trig = 12;
int echo = 13;

void setup() {
  Serial.begin(9600);

  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
  myservo.attach(3);
  myservo.write(0); // 0 ~ 179까지 각도가 가능, 일단 0으로 초기화한다.
}

void loop() {
  digitalWrite(trig, HIGH);
  delay(10);
  digitalWrite(trig, LOW);

  int duration = pulseIn(echo, HIGH);
  int distance = (duration/2) / 29.1;

  Serial.print(distance);
  Serial.println("cm");
  delay(100);

  if(distance > 0 && distance <= 10) {
    myservo.write(179);
  } else {
    delay(2000);
    myservo.write(0);
  }

}
