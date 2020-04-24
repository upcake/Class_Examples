#include<Servo.h>

Servo myservo;
int trig = 6;
int echo = 7;

int crossState = 0;

void setup() {  
  Serial.begin(9600);
  
  myservo.attach(3);
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT); 

  myservo.write(0);
}

void loop() {

  digitalWrite(trig, HIGH);
  delay(10);
  digitalWrite(trig, LOW);
  
  int duration = pulseIn(echo, HIGH);
  int distance = (duration/2) / 29.1;
  delay(300);
  
  Serial.print(distance);
  Serial.println("cm");

  if(distance < 15){
    myservo.write(90);
    crossState = 1;
  }else if(distance >= 25 && crossState == 1){
    delay(2000);
    myservo.write(0);
    crossState = 0;
  }
  
  
  
}
