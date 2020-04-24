int ledRed = 11;

void setup() {
  Serial.begin(9600);
  pinMode(ledRed, OUTPUT);
}

void loop() {
  int photoRes = analogRead(A0);
  int value = map(photoRes, 0, 1023, 255, 0);
  // 주변이 밝을 때는 불이 꺼지고 어두울 때 켜짐
  Serial.println(photoRes);

  delay(200);

  if(value > 127) {
    analogWrite(ledRed, value);  
  } else {
    analogWrite(ledRed, 0);
  }
}
