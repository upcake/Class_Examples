#include<Servo.h>
Servo myservo;

int trig = 12;
int echo = 13;

int interval = 3;   // 모터를 3초 후에 내리겠다.
int lastMillis = 0; // 물체가 지나간 마지막 시간

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

  if(distance <15) {
    myservo.write(90);
    lastMillis = millis()/1000; // 시간을 얻는 함수
  } else if(distance >= 15) {
    if(millis()/1000 - lastMillis >= interval) {  // 총 지난 시간에서 마지막으로 물체가 지나간 시간을 뺀 값이 interval보다 작으면 모터를 0으로 돌린다.
      myservo.write(0);
    }
  }
}
