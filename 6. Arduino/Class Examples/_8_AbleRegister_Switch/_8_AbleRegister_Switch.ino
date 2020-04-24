
int PinR = 9;
int PinG = 10;
int PinB = 11;

int switch01 = 3; 
int switch02 = 4; 
int switch03 = 5; 

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  
  pinMode(switch01, INPUT);
  pinMode(switch02, INPUT);
  pinMode(switch03, INPUT);
  
  pinMode(PinR, OUTPUT);
  pinMode(PinG, OUTPUT);
  pinMode(PinB, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {

   Serial.print("switch01 : ");
   Serial.print(digitalRead(switch01));
   Serial.print("   switch02 : ");
   Serial.print(digitalRead(switch02));
   Serial.print("   switch03 : ");
   Serial.println(digitalRead(switch03));   

  if(digitalRead(switch01) == 1){
     digitalWrite(PinR, HIGH);
     digitalWrite(PinG, LOW);
     digitalWrite(PinB, LOW); 
  }
  if(digitalRead(switch02) == 1){
     digitalWrite(PinR, LOW);
     digitalWrite(PinG, HIGH);
     digitalWrite(PinB, LOW); 
  }
  if(digitalRead(switch03) == 1){
     digitalWrite(PinR, LOW);
     digitalWrite(PinG, LOW);
     digitalWrite(PinB, HIGH); 

     for(int i=0; i<256; i++)
      for(int j=0; j<256; j++)
        for(int k=0; k<256; k++){
          analogWrite(red, i);
          analogWrite(green, j);
          analogWrite(blue, k);
          delay(10);
        }
     
  }

  delay(100);  
 
}
