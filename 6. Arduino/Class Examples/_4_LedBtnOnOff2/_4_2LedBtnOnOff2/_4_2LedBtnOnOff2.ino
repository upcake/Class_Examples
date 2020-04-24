int ledred = 12;
int btn1 = 10;

void setup() { 
  Serial.begin(9600);
   
  pinMode(ledred, OUTPUT);
  pinMode(btn1, INPUT);
}

void loop() {
  
 int curBtn1 = digitalRead(btn1);
 Serial.println(curBtn1);

 if(curBtn1 == 0){
  digitalWrite(ledred, LOW);
 }else{
  digitalWrite(ledred, HIGH);
 } 
 
}
