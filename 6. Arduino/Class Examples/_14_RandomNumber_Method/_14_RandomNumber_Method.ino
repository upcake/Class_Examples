#include <stdio.h>

void RPrint();

int num1 = 0;
int chkNum = 0;

void setup() {  
  Serial.begin(9600);
    
  randomSeed(analogRead(A0));   //아날로그핀 0번을 seed값으로 초기화 한다.
  RPrint();
//  Serial.println("Making Random Number ...");
//  num1 = random(1, 10);      // 1~9 까지 값나옴
//  Serial.println("Let's Start ");
  
//  num1 = random(50, 100);  // 50~99 까지 값나옴
 
}

void loop() {
  
  if(Serial.available()){
     chkNum = Serial.parseInt();
     
     if(chkNum == num1){
        Serial.print(chkNum);
        Serial.println(" : Sucess");

        RPrint();
//        Serial.println("Making Random Number ...");
//        num1 = random(1,10);
//        Serial.println("Let's Start ");
     }
     else{
       Serial.print(chkNum);
       Serial.println(" : Fail");
     }
  }  
  
}

  void  RPrint(){
    Serial.println("Making Random Number ...");
    num1 = random(1,10);
    Serial.println("Let's Start ");
  }

