int red = 9;
int blue = 10;
int green = 11;
int count = 0;
char c;

void setup() {  
  Serial.begin(9600);
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void loop() {
  int val = 0;
  while(Serial.available()){
     //c = Serial.read();
     val = Serial.parseInt();
     
     count++;   
     Serial.print(count); 
     Serial.print(" : ");  
     Serial.println(val);     
  }
  if(val == 1){
    digitalWrite(red, HIGH);
    digitalWrite(blue, LOW);
    digitalWrite(green, LOW);
  }
  if(val == 2){
    digitalWrite(red, LOW);
    digitalWrite(blue, HIGH);
    digitalWrite(green, LOW);
  }
  if(val== 3){
    digitalWrite(red, LOW);
    digitalWrite(blue, LOW);
    digitalWrite(green, HIGH);
  }
  if(val == 4){
    digitalWrite(red, LOW);
    digitalWrite(blue, LOW);
    digitalWrite(green, LOW);
  }
}
