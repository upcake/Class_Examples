
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); 

  pinMode(11, OUTPUT);
}

void loop() {

  int val = analogRead(A0);

  Serial.println(val);

  int ledVal = map(val, 250, 870, 255, 0);
  analogWrite(11, ledVal);

  delay(500);
     
}
