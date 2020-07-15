int led = 10; //~ mark port
int val = 0;

void setup() {
  Serial.begin(9600);
  Serial.println("input 0 ~ 255");
  pinMode(led, OUTPUT);
} //setup()

void loop() {
  if(Serial.available()) {
    val = Serial.parseInt();
    Serial.println(val);
    analogWrite(led, val);
  }
  delay(50);
} //loop()
