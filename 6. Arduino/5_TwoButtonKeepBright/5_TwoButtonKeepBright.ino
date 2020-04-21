int ledRed = 13;
int ledGreen = 12;
int btn1 = 10;

int before = 0;
int btnCnt = 0;

void setup() {
  Serial.begin(9600);
  pinMode(ledRed, OUTPUT);
  pinMode(ledGreen, OUTPUT);
  pinMode(btn1, INPUT);
}

void loop() {
  int curBtnState = digitalRead(btn1);
  Serial.print(curBtnState);
  Serial.print(" : ");
  Serial.print(before);
  Serial.print(" : ");
  Serial.println(btnCnt);

  if(curBtnState == 1 && before == 0) {
    before = 1;
    btnCnt++;

    if(btnCnt == 3) {
      btnCnt = 0;
    }
  }
  if(curBtnState == 0) {
    before = 0;
  }

  if(btnCnt == 0) {
    digitalWrite(ledRed, LOW);
    digitalWrite(ledGreen, LOW);
  }
  if(btnCnt == 1) {
    digitalWrite(ledRed, HIGH);
  }
  if(btnCnt == 2) {
    digitalWrite(ledGreen, HIGH);
  }
}
