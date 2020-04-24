#define ENABLE_A  3  
#define IN1_A  4   
#define IN2_A  5   
#define ENABLE_B  9  
#define IN3_B  7   
#define IN4_B  8   
  
byte speedDC = 255;  
  
void setup()  
{  
  pinMode(ENABLE_A,OUTPUT);  
  pinMode(IN1_A,OUTPUT);  
  pinMode(IN2_A,OUTPUT);  
   pinMode(ENABLE_B,OUTPUT);  
  pinMode(IN3_B,OUTPUT);  
  pinMode(IN4_B,OUTPUT);  
}  
  
void motor_speed(int spd)  
{  
  analogWrite(ENABLE_A,spd);  
  analogWrite(ENABLE_B,spd);  
}  
  
void motor_dir(int dir)  
{  
  if ( dir == 0 ) {  // forward   
     digitalWrite(IN1_A,HIGH);  
     digitalWrite(IN2_A,LOW);  
     digitalWrite(IN3_B,HIGH);  
     digitalWrite(IN4_B,LOW);  
  }  
  else if ( dir == 1 ) { // turn right  
     digitalWrite(IN1_A,HIGH);  
     digitalWrite(IN2_A,LOW);  
     digitalWrite(IN3_B,LOW);  
     digitalWrite(IN4_B,HIGH);  
  }  
  else if ( dir == 2 ) { // turn left  
     digitalWrite(IN1_A,LOW);  
     digitalWrite(IN2_A,HIGH);  
     digitalWrite(IN3_B,HIGH);  
     digitalWrite(IN4_B,LOW);  
  }    
  else if ( dir == 4 ) { // backward  
     digitalWrite(IN1_A,LOW);  
     digitalWrite(IN2_A,HIGH);  
     digitalWrite(IN3_B,LOW);  
     digitalWrite(IN4_B,HIGH);  
  }     
}  
  
void loop()  
{  
  motor_speed(50);
  motor_dir(0);  
  delay(2000);
  motor_speed(0);
  delay(1000);
  
  motor_speed(100);  
  motor_dir(1);  
  delay(2000); 
  motor_speed(0);
  delay(1000);

  motor_speed(254); 
  motor_dir(2);  
  delay(2000);  
  motor_speed(0);
  delay(1000); 

  motor_speed(50); 
  motor_dir(4);  
  delay(2000);  
  motor_speed(0);
  delay(1000); 
}  
