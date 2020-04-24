void setup() {  
  Serial.begin(9600);
  
  for(int i = 3; i <= 5; i++){
    pinMode(i, OUTPUT);
  }  
}

void loop() {
  
  if(Serial.available()){
     char c = Serial.read();
     Serial.println(c);
      
      if(c=='1'){
       digitalWrite(3, HIGH);
       //digitalWrite(4, LOW);
       //digitalWrite(5, LOW);
      } 
      if(c=='2'){
       //digitalWrite(3, LOW);
       digitalWrite(4, HIGH);
       //digitalWrite(5, LOW);
      } 
      if(c=='3'){
       //digitalWrite(3, LOW);
       //digitalWrite(4, LOW);
       digitalWrite(5, HIGH);
      } 
      if(c=='4'){
       digitalWrite(3, LOW);
       digitalWrite(4, LOW);
       digitalWrite(5, LOW);
      } 
      
    }
}
