void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  for(int i = 3; i <= 5; i++){
    pinMode(i, OUTPUT);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
     int count = Serial.parseInt();
     Serial.println(count);     
     
     if(count < 4){
       for(int i = 3; i <= 5; i++){
          digitalWrite(i, LOW);
        }
        for(int i = 3; i < count + 3; i++){
          digitalWrite(i, HIGH);
        }
       
     }
     else if(count == 4){
       for(int i = 3; i <= 5; i++){
          digitalWrite(i, LOW);
        }
     }
  }
}
