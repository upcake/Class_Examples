
// 시리얼모니터 열고
// AT 엔터 -> 응답 OK
// AT+NAMEXXXXXX -> 응답 OKsetname : 이름변경
// AT+PIN1234 -> 응답 OKsetPIN : 비밀번호변경
// AT+BAUD4 ->   응답 OK9600 : 통신속도변경 
//               1 -> 1200  2 -> 2400  3 -> 4800  4 -> 9600  5 ->19200  6 -> 38400  7 -> 57600  8 -> 115200
// AT+ROLE=S ->  응답 OK+ROLE:S   =>   M: Master S: Slave (기본 SLAVE 변경안해줘도 됨)

#include <SoftwareSerial.h>

//우노보드의 RX TX 지정
SoftwareSerial bluetooth(10, 11);   // bluetooth(RX, TX)

void setup() 
{
  Serial.begin(9600);
  bluetooth.begin(9600);
}

void loop()
{
  if (bluetooth.available()) 
  {
    Serial.write(bluetooth.read());
  }

  if (Serial.available()) 
  {
    bluetooth.write(Serial.read());
  }
}
