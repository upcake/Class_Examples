#include<Servo.h>
Servo myservo;

void setup() {  
  Serial.begin(9600);
  
  myservo.attach(3);
}

void loop() {
  int gabunAngle = map(analogRead(A0), 0, 1023, 0, 179);  
  Serial.println(gabunAngle);  
  myservo.write(gabunAngle);
}
