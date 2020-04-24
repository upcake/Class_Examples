void setRandom();

int num1 = 0;
int chkNum = 0;

void setup() {  
  Serial.begin(9600);
  //아날로그핀 0번을 seed값으로 초기화 한다.
  randomSeed(analogRead(A0));
  setRandom();
   
  //num1 = random(50, 100);  // 50~99 까지 값나옴
 
}

void loop() {
  
  if(Serial.available()){
     chkNum = Serial.parseInt();     
//     Serial.println(num1);
     
     if(chkNum == num1){
        Serial.print(chkNum);
        Serial.println(" : Sucess");
        setRandom();        
       
     }else{
       Serial.print(chkNum);
       Serial.println(" : Fail");
     }
  }  
  
}

void setRandom(){
  Serial.println("Making Random Number ...");
  Serial.println("Let's Start ");
  num1 = random(1,10);
}
