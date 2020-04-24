#define B 494  // 시

int trig = 12;
int echo = 11;
int piezoPin = 10;
int tempo = 200;

void setup() {
  // Vcc - +극
  // Gnd - -극
  // Trig - 초음파를 발사
  // Echo - 초음파가 다시 돌아오는 시간으로 거리 측정
  Serial.begin(9600);

  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
  pinMode(piezoPin, OUTPUT);
}

void loop() {
  digitalWrite(trig, HIGH);
  delay(10);
  digitalWrite(trig, LOW);
  
  int duration = pulseIn(echo, HIGH);
  int distance = (duration/2) / 29.1; // 거리 = 초음파의 이동 시간 / 음파의 속도

  Serial.print(distance);
  Serial.println("cm");
  delay(100);


  if(distance <= 50 && distance >= 0) {
    if(distance > 35) {
      tone (piezoPin, 494, 200);
      delay(1000);
    }
    if(distance <= 35 && distance > 15) {
      tone (piezoPin, 494, 200);
      delay(700);
    }
    if(distance <= 15) {
      tone (piezoPin, 494, 200);
      delay(700);
    }
  }
}
