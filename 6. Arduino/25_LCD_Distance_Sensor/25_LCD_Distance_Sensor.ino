#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

int trig = 12;
int echo = 13;

// Set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal_I2C lcd(0x27, 16, 2); // 안되면 0x3F로 시도해본다.
//LiquidCrystal_I2C lcd(0x3F, 16, 2);

void setup() {
  Serial.begin(9600);
  lcd.begin();
  lcd.backlight();
  lcd.setCursor(0,0);
  
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
}

void loop() {
  digitalWrite(trig, HIGH);
  delay(10);
  digitalWrite(trig, LOW);

  int duration = pulseIn(echo, HIGH);
  int distance = (duration/2) / 29.1;

  Serial.print(distance);
  Serial.println("cm");
  delay(100);

  if(distance > 0 && distance <= 50) {
    lcd.print(distance);
    lcd.print("cm");
    delay(1000);
    lcd.clear();
    lcd.setCursor(0, 0);
  }
}
