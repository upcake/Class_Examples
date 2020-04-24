int num1 = 0;
int num2 = 0;
int num3 = 0;

int strike = 0;
int ball = 0;

void setup() {  
  Serial.begin(9600);
  randomSeed(analogRead(A0));
  num1 = random(1,10);
  num2 = random(1,10);  
  num3 = random(1,10); 
  
  while(num1 == num2 || num1 == num3 || num2 == num3){
    num1 = random(1,10);
    num2 = random(1,10);  
    num3 = random(1,10);
  }
  
  Serial.print(num1);
  Serial.print(", ");
  Serial.print(num2);
  Serial.print(", ");
  Serial.println(num3);
  Serial.println("===============================> ");
  Serial.println("Game Start ");
   
  for(int i = 2; i <= 8; i++){
     pinMode(i, OUTPUT); 
  }
}

void loop() {
  
   if(Serial.available()){
       strike =0;
       ball = 0;
       
       for(int i = 2; i <= 8; i++){
            digitalWrite(i , LOW);
            delay(100);
       }
       
       int chkNum1 = Serial.parseInt();
       int chkNum2 = Serial.parseInt();
       int chkNum3 = Serial.parseInt();
        
        Serial.print("INPUT1 : " );
        Serial.println(chkNum1);
        Serial.print("INPUT2 : " );
        Serial.println(chkNum2);
        Serial.print("INPUT3 : " );
        Serial.println(chkNum3);
        
        if(num1 == chkNum1){
          strike++;
        }
        if(num2 == chkNum1){
          ball++;
        }
        if(num3 == chkNum1){
          ball++;
        }
        
        if(num1 == chkNum2){
          ball++;
        }
        if(num2 == chkNum2){
          strike++;
        }
        if(num3 == chkNum2){
          ball++;
        }
        
        if(num1 == chkNum3){
          ball++;
        }
        if(num2 == chkNum3){
          ball++;
        }
        if(num3 == chkNum3){
          strike++;
        }
        
        Serial.print("Strike : ");
        Serial.println(strike);
        Serial.print("Ball : ");
        Serial.println(ball);
        
        for(int i = 0; i < ball; i++){
            digitalWrite(i + 2, HIGH);
        }
        for(int i = 0; i < strike; i++){
          if(strike != 3){
             digitalWrite(i + 5, HIGH);
          }           
        }
        
        if(ball == 0 && strike == 0){
            digitalWrite(8 , HIGH);
        }
        
        if(strike == 3){
           Serial.println("Congraturation !!!"); 
           
           int count = 0;  
           do{
             for(int i = 2; i <= 8; i++){
             digitalWrite(i , HIGH);
             delay(200);
             digitalWrite(i , LOW);
             }           
             count++;
           }while(count <= 6);             
          
        }
        
    }  
  
}
