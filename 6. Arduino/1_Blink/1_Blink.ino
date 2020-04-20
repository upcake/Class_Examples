void setup() {
  pinMode(13, OUTPUT); // 13번 포트를 OUTPUT으로 사용
}

void loop() {
  digitalWrite(13, HIGH); // HIGH 불을 키는 예약어
  delay(1000);            // 1초간 상태 유지
  digitalWrite(13, LOW);  // LOW 불을 끄는 예약어
  delay(1000);
}
