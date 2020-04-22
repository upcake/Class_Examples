void setRandom(); // 메서드를 사용하기에 앞서 먼저 선언해줘야 한다.

int ledRed = 11;
int ledGreen = 9;
int num1 = 0;
int chkNum = 0;

void setup() {
  Serial.begin(9600);
  pinMode(ledRed, OUTPUT);
  pinMode(ledGreen, OUTPUT);
  randomSeed(analogRead(A0)); // 아날로그 핀 0번을 seed 값으로 초기화
  setRandom();
//  Serial.println("Making Random Number ...");
//  Serial.println("Let's Start");
//  num1 = random(1, 10); // 1 ~ 9까지
//  num1 = random(50, 100); // 50 ~ 99까지
  Serial.print("Random Number : ");
  Serial.println(num1);  
}

void loop() {
  if(Serial.available()) {
    chkNum = Serial.parseInt();
    if(chkNum == num1) {
      Serial.print(chkNum);
      Serial.println(" : Success");
      digitalWrite(ledGreen, HIGH);
      delay(1000);
      digitalWrite(ledGreen, LOW);
      setRandom();
//      Serial.println("Making Random Number ...");
//      Serial.println("Let's Start");
//      num1 = random(1, 10);
      Serial.print("Random Number : ");
      Serial.println(num1);   
    } else {
      Serial.print(chkNum);
      Serial.println(" : Fail");
      digitalWrite(ledRed, HIGH);
      delay(1000);
      digitalWrite(ledRed, LOW);
    }
  }
}

void setRandom() {
  Serial.println("Making Random Number ...");
  Serial.println("Let's Start");
  num1 = random(1, 10);
}
