void setup() {
  pinMode(5, OUTPUT); // 5번 포트를 OUTPUT으로 사용
  pinMode(6, OUTPUT);
}

void loop() {
  analogWrite(5, 0); // 5번 포트에 아날로그 형식으로 0부터 출력
  delay(100);
  analogWrite(5, 80);
  delay(100);
  analogWrite(5, 160);
  delay(100);
  analogWrite(5, 255);  // 아날로그형식은 0 ~ 255
  delay(100);

  analogWrite(6, 100);  // 6번 포트에 아날로그 형식으로 100부터 출력
  delay(100);
  analogWrite(6, 180);
  delay(100);
  analogWrite(6, 255);
  delay(100);
}
