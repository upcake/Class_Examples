int trig = 12;
int echo = 11;

void setup() {  
  Serial.begin(9600);
  
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
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
 
  
//  if(distance >= 0 && distance <= 100){
//          
//      if(distance > 60){
//          tone (piezoPin, 494, 200);   // 시   
//          delay(1000);
//      }
//      if(distance <= 60 && distance > 40){
//          tone (piezoPin, 494, 200);   // 시
//          delay(700);
//      }
//      if(distance <= 40 && distance >20){
//         tone (piezoPin, 494, 200);   // 시
//         delay(300);
//      }
//      if(distance <= 20){
//         tone (piezoPin, 494, 200);   // 시
//         delay(100);
//      }
//    
//    
//  }
}
