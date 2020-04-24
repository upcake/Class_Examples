#define C 262  // 도
#define D 294  // 레
#define E 330  // 미
#define F 349  // 파
#define G 392  // 솔
#define A 440  // 라
#define B 494  // 시

int piezoPin = 7;

void setup() {  
  Serial.begin(9600); 

  pinMode(piezoPin, OUTPUT);  
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
}

void loop() { 
  if(digitalRead(3) == 1){
    tone (piezoPin, C, 500);     
  }
  if(digitalRead(4) == 1){
    tone (piezoPin, D, 500);   
  }
  if(digitalRead(5) == 1){
    tone (piezoPin, E, 500);   
  }

  Serial.println(digitalRead(3));
  Serial.println(digitalRead(4));
  Serial.println(digitalRead(5));
}
