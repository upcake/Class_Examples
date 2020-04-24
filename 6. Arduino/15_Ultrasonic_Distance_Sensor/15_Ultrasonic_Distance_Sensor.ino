int trig = 12;
int echo = 11;

void setup() {
  // Vcc - +극
  // Gnd - -극
  // Trig - 초음파를 발사
  // Echo - 초음파가 다시 돌아오는 시간으로 거리 측정
  Serial.begin(9600);

  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
}

void loop() {
  digitalWrite(trig, HIGH);
  delay(10);
  digitalWrite(trig, LOW);
  
  int duration = pulseIn(echo, HIGH);
  int distance = (duration/2) / 29.1;

  Serial.print(distance);
  Serial.println("cm");
  delay(100);
}
