int num1 = 0;
int num2 = 0;
int num3 = 0;
int chkNum1 = 0;
int chkNum2 = 0;
int chkNum3 = 0;
int strike = 0;
int ball = 0;

void setup() {
  Serial.begin(9600);
  randomSeed(analogRead(A0));
  num1 = random(1, 10);
  num2 = random(1, 10);
  num3 = random(1, 10);

  while(num1 == num2 || num1 == num3 || num2 == num3) {
    num1 = random(1, 10);
    num2 = random(1, 10);
    num3 = random(1, 10);
  }

  Serial.print(num1);
  Serial.print(", ");
  Serial.print(num2);
  Serial.print(", ");
  Serial.println(num3);
  Serial.println("========================================");
  Serial.println("Game Start!");

  for(int i = 2; i <= 6; i++) {
    pinMode(i, OUTPUT);
  }
} // setup()

void loop() {
  if(Serial.available()) {
    strike = 0;
    ball = 0;

    chkNum1 = Serial.parseInt();
    chkNum2 = Serial.parseInt();
    chkNum3 = Serial.parseInt();

    Serial.print("chkNum ▶ ");
    Serial.print(chkNum1);
    Serial.print("/");
    Serial.print(chkNum2);
    Serial.print("/");
    Serial.println(chkNum3);

    if(num1 == chkNum1) {
      strike++;
    } else if(num1 == chkNum2 || num1 == chkNum3) {
      ball++;
    }
    if(num2 == chkNum2) {
      strike++;
    } else if(num2 == chkNum1 || num2 == chkNum3) {
      ball++;
    }
    if(num3 == chkNum3) {
      strike++;
    } else if(num3 == chkNum1 || num3 == chkNum2) {
      ball++;
    }

    Serial.print("strike : ");
    Serial.print(strike);
    Serial.print(" / ball : ");
    Serial.println(ball);
    
    if(strike > 0 && ball == 0) {
      if(strike == 1) {
        digitalWrite(5, HIGH);
        delay(1000);
        digitalWrite(5, LOW);
      } else if(strike == 2) {
        digitalWrite(5, HIGH);
        digitalWrite(6, HIGH);
        delay(1000);
        digitalWrite(5, LOW);
        digitalWrite(6, LOW);
      } else if(strike == 3) {
        Serial.println("You Win!");
        int cnt = 0;
        while(true) {
          if(cnt == 9) {
            break;
          }
          for (int i = 2; i <= 6; i++) {
            digitalWrite(i, HIGH);
            delay(300);
            digitalWrite(i, LOW);
          }
          cnt++;
        }
      } // if strike == 3
    } else if(strike == 0 && ball > 0) {
      if(ball == 1) {
        digitalWrite(2, HIGH);
        delay(1000);
        digitalWrite(2, LOW);
      } else if(ball == 2) {
        digitalWrite(2, HIGH);
        digitalWrite(3, HIGH);
        delay(1000);
        digitalWrite(2, LOW);
        digitalWrite(3, LOW);
      } else if(ball == 3) {
        digitalWrite(2, HIGH);
        digitalWrite(3, HIGH);
        digitalWrite(4, HIGH);
        delay(1000);
        digitalWrite(2, LOW);
        digitalWrite(3, LOW);
        digitalWrite(4, LOW);
      }
    } else if(strike > 0 && ball > 0) {
      if(strike == 1 && ball == 1) {
        digitalWrite(2, HIGH);
        digitalWrite(5, HIGH);
        delay(1000);
        digitalWrite(2, LOW);
        digitalWrite(5, LOW);
      } else if (strike == 1 && ball == 2) {
        digitalWrite(2, HIGH);
        digitalWrite(3, HIGH);
        digitalWrite(5, HIGH);
        delay(1000);
        digitalWrite(2, LOW);
        digitalWrite(3, LOW);
        digitalWrite(5, LOW);
      }
    }
  } // if Serial available
} // loop()
