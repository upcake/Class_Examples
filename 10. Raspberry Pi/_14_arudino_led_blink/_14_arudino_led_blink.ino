int led = 7;
int val = 0;

void setup() {
  pinMode(led, OUTPUT);
} //setup()

void loop() {
  digitalWrite(led,HIGH);
  delay(1000);
  digitalWrite(led, LOW);
  delay(1000);0
} //loop()
