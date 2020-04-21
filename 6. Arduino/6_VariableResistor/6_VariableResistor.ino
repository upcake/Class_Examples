int ledRed = 11;


void setup() {
  Serial.begin(9600);
  pinMode(ledRed, OUTPUT);
}

void loop() {
  int varRes = analogRead(A0);
  int value = map(varRes, 0, 1023, 0, 255);
  // map(아날로그변수, 최소값, 최대값, 변환시킬최소값, 최대값);
  // 아날로그 값을 범위에 맞게 알맞게 변환시킬때 사용하는 메서드
  
  Serial.print(varRes);
  Serial.print(" : ");
  Serial.println(value);

  analogWrite(ledRed, value);
}
