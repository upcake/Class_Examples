int num1 = 0;
int chkNum = 0;

void setup() {  
  Serial.begin(9600);

  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);

  Serial.println("Making Random Number ...");
  randomSeed(analogRead(A0));   //아날로그핀 0번을 seed값으로 초기화 한다.
  Serial.println("Let's Start ");
  num1 = random(1, 10);      // 1~9 까지 값나옴
  //num1 = random(50, 100);  // 50~99 까지 값나옴
  Serial.print("Random Number : ");
  Serial.println(num1);
}

void loop() {
  
  if(Serial.available()){
     chkNum = Serial.parseInt();  
     
     if(chkNum == num1){        
        
        Serial.print(chkNum);
        Serial.println(" : Sucess");  

        digitalWrite(4, HIGH);
        delay(5000);
        digitalWrite(4, LOW);
        
        Serial.println("Again Making Random Number ...");
        num1 = random(1,10);
        Serial.println("Let's Start ");
       
        Serial.print("Random Number : ");
        Serial.println(num1);
     } else {      
      
       Serial.print(chkNum);
       Serial.println(" : Fail");

       digitalWrite(3, HIGH);
       delay(5000);
       digitalWrite(3, LOW);
     }
  }  
  
}
