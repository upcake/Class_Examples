
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); 
 
}

void loop() {

  int val = analogRead(A0);

  Serial.println(val);

  delay(500);
     
}
