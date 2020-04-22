int ledRed = 11;
int ledBlue = 10;
int ledGreen = 9;
int count = 0;

void setup() {
  Serial.begin(9600);
  pinMode(ledRed, OUTPUT);
  pinMode(ledGreen, OUTPUT);
  pinMode(ledBlue, OUTPUT);
}

void loop() {
  while(Serial.available()) { // Serial 버퍼에 값이 들어올 수 있는지 확인해서 true / false 리턴
//    char c = Serial.read();
    int val = Serial.parseInt();

    count++;
    Serial.print(count);
    Serial.print(" : ");
//    Serial.println(c);  // char 타입으로 입력 받으면 한 글자씩 입력받는다.
    Serial.println(val);  // int 타입으로 입력 받으면 숫자만 입력 받고 문자는 무시한다.
    // 1/2/3 이런 식으로 문자를 섞어서 원하는 숫자를 한번에 입력할 수 있다.
    
//   if(c == '0') {
    if(val == 0) {
      digitalWrite(ledRed, LOW);
      digitalWrite(ledGreen, LOW);
      digitalWrite(ledBlue, LOW);
   }

//   if(c == '1') {
    if(val == 1) {
      digitalWrite(ledRed, HIGH);
   }

//   if(c == '2') {
    if(val == 2) {
      digitalWrite(ledBlue, HIGH);
   }
 
//   if(c == '3') {
    if(val == 3) {
      digitalWrite(ledGreen, HIGH);
   }
  }
}
