
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); 

  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
}

void loop() {

  int val = analogRead(A0);

  Serial.println(val);

  int ledVal = map(val, 250, 870, 255, 0);

  if(ledVal >= 0 && ledVal < 80){
    digitalWrite(11, HIGH);
    digitalWrite(12, LOW);
    digitalWrite(13, LOW);
  }
  if(ledVal >= 80 && ledVal < 160){
    digitalWrite(11, LOW);
    digitalWrite(12, HIGH);
    digitalWrite(13, LOW);
  }if(ledVal >= 160){
    digitalWrite(11, LOW);
    digitalWrite(12, LOW);
    digitalWrite(13, HIGH);
  }

  delay(500);
     
}
