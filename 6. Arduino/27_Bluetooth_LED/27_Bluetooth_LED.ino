#include <SoftwareSerial.h>    
SoftwareSerial BTSerial(10, 11);
 
int red = 7;
int green = 5;
 
void setup() {
  BTSerial.begin(9600);
  pinMode(red, OUTPUT); 
  pinMode(green, OUTPUT);

}
 
void loop() {
  if(BTSerial.available())  
  {
    char bt;                
    bt = BTSerial.read();   
    if(bt == 'a')              
      digitalWrite(red, HIGH); 
    if(bt == 'b')
      digitalWrite(green, HIGH);
    if(bt == 'c')
      digitalWrite(red, LOW);
    if(bt == 'd')
      digitalWrite(green, LOW);
  }
}
