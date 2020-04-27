int ledRed = 12;
int btn1 = 10;

int before = 0;
int btnCnt = 0;

void setup() {
  Serial.begin(9600);
  pinMode(ledRed, OUTPUT);
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

    if(btnCnt == 2) {
      btnCnt = 0;
    }
  }
  if(curBtnState == 0) {
    before = 0;
  }

  if(btnCnt == 0) {
    digitalWrite(ledRed, LOW);
  }
  if(btnCnt == 1) {
    digitalWrite(ledRed, HIGH);
  }
}
/*
누른다      - before 1, btnCnt 1      - 불이 켜진다.
손을 뗀다    - before 0, btnCnt 1      - 불이 켜진 상태
다시 누른다 - before 1, btnCnt 2 → 0  - 불이 꺼진다.
손을 뗀다    - before 0, btnCnt 0      - 불이 꺼진 상태
*/
