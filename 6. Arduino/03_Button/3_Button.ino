int ledRed = 12;
int btn1 = 10;

void setup() {
  Serial.begin(9600); // 시리얼 통신
  pinMode(ledRed, OUTPUT);
  pinMode(btn1, INPUT);
}

void loop() {
  int curBtn1 = digitalRead(btn1);
  Serial.println(curBtn1);

  if(curBtn1 == 1) {
    digitalWrite(ledRed, HIGH);
  } else {
    digitalWrite(ledRed, LOW);
  }
}
