#include<Servo.h>
Servo myservo;

void setup() {  
  myservo.attach(3);
  myservo.write(0);
}

void loop() {
  
  for(int i =0; i <= 179; i++){
    myservo.write(i);
    delay(10);
  }
  
  
  for(int i =179; i >= 0; i--){
    myservo.write(i);
    delay(10);
  }
//  myservo.write(1);
//  delay(1000);
//  myservo.write(179);
//  delay(1000);
}
