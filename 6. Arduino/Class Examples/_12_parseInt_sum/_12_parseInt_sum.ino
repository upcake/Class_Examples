void setup() {  
  Serial.begin(9600);
}

int sum = 0;

void loop() {  
  if(Serial.available()){
     int num = Serial.parseInt();
    
    Serial.print(sum);
    Serial.print(" + ");
    Serial.print(num);
    Serial.print(" = ");
    sum += num;
    Serial.println(sum); 
  }
}
