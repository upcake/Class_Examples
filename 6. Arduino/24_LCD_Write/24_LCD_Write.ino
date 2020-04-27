#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

// Set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal_I2C lcd(0x27, 16, 2); // 안되면 0x3F로 시도해본다.
//LiquidCrystal_I2C lcd(0x3F, 16, 2);

void setup()
{
  Serial.begin(9600);
  lcd.begin();
  lcd.backlight();
  lcd.setCursor(0,0);
}

void loop()
{
  while(Serial.available()) {
    lcd.write(Serial.read());
//    lcd.print(Serial.read()); // 아스키 코드로 출력되므로 write 메서드를 쓴다.
  }
}
