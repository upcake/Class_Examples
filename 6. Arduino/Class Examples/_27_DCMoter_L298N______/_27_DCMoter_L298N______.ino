int A_motor_L = 7;                 //A_motor_L을 7번핀으로 설정합니다.
int A_motor_R = 8;                       //A_motor_R을 8번핀으로 설정합니다.
int B_motor_L = 4;                          //B_motor_L을 4번핀으로 설정합니다.
int B_motor_R = 5;                          //B_motor_R을 7번핀으로 설정합니다.
int A_motor_S = 9;                          //A_motor_S을 9번핀으로 설정합니다. (속도 제어)
int B_motor_S = 3;                          //B_motor_S을 3번핀으로 설정합니다. (속도 제어)
void setup() {
  pinMode(A_motor_L, OUTPUT);       // Motor A 방향설정1
  pinMode(A_motor_R, OUTPUT);       // Motor A 방향설정2
  pinMode(B_motor_L, OUTPUT);       // Motor B 방향설정1
  pinMode(B_motor_R, OUTPUT);       // Motor B 방향설정2
}
void loop() {
  /*모터A설정*/
  digitalWrite(A_motor_L, HIGH);             // Motor A 방향설정1
  digitalWrite(A_motor_R, LOW);              // Motor A 방향설정2
  analogWrite(A_motor_S, 100);               // Motor A 속도조절 (0~2B_motor_RB_motor_R)
  /*모터B설정*/
  digitalWrite(B_motor_L, LOW);              // Motor B 방향설정1
  digitalWrite(B_motor_R, HIGH);             // Motor B 방향설정2
  analogWrite(B_motor_S, 50);                // Motor B 속도조절 (0~2B_motor_RB_motor_R)
  delay(3000);                               // 3초 유지
  /*모터A설정*/
  digitalWrite(A_motor_L, LOW);              // Motor A 방향설정1
  digitalWrite(A_motor_R, HIGH);             // Motor A 방향설정2
  analogWrite(A_motor_S, 200);               // Motor A 속도조절 (0~2B_motor_RB_motor_R)
  /*모터B설정*/
  digitalWrite(B_motor_L, HIGH);             // Motor B 방향설정1
  digitalWrite(B_motor_R, LOW);              // Motor B 방향설정2
  analogWrite(B_motor_S, 150);               // Motor B 속도조절 (0~2B_motor_RB_motor_R)
  delay(3000);                               // 3초 유지
}
