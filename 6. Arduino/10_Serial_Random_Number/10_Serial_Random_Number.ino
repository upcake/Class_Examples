int num1 = 0;
int chkNum = 0;

void setup() {
  Serial.begin(9600);
  randomSeed(analogRead(A0)); // 아날로그 핀 0번을 seed 값으로 초기화

  Serial.println("Making Random Number ...");
  Serial.println("Let's Start");
  num1 = random(1, 10); // 1 ~ 9까지
//  num1 = random(50, 100); // 50 ~ 99까지
  
}

void loop() {
  if(Serial.available()) {
    chkNum = Serial.parseInt();
    if(chkNum == num1) {
      Serial.print(chkNum);
      Serial.println(" : Success");
      Serial.println("Making Random Number ...");
      Serial.println("Let's Start");
      num1 = random(1, 10);
    } else {
      Serial.print(chkNum);
      Serial.println(" : Fail");
    }
  }
}
