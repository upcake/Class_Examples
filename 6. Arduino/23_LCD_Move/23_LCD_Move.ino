#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

// Set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal_I2C lcd(0x27, 16, 2); // 안되면 0x3F로 시도해본다.
//LiquidCrystal_I2C lcd(0x3F, 16, 2);

void setup()
{
	// initialize the LCD
	lcd.begin();

	// Turn on the blacklight and print a message.
	lcd.backlight();
  lcd.setCursor(0,0);
	lcd.print("Hello, world!");
}

void loop()
{
  // LCD 패널의 구성은 16x2의 테이블로 구성되어 있음, (0, 0) ~ (15, 1)
  // 글자 왼쪽 끝으로 이동
  for (int posCnt = 0; posCnt < 13; posCnt++) { // 움직일 글자 수 13
    lcd.scrollDisplayLeft();
    delay(150);
  }
  
  // 글자 오른쪽 끝으로 이동
  for (int posCnt = 0; posCnt < 29; posCnt++) { // 글자 수 13 + 칸 수 16
    lcd.scrollDisplayRight();
    delay(150);    
  }

  // 글자 원위치
  for (int posCnt = 0; posCnt < 16; posCnt++) { // 칸 수 16
    lcd.scrollDisplayLeft();
    delay(150);
  }

  // 초 출력
  lcd.setCursor(0, 0);
  lcd.print("Hello, world!");
  lcd.setCursor(0, 1);
  lcd.print(millis() / 1000);

  // 글자 깜빡이게 하기
  for(int i = 0; i < 10; i++) {
    lcd.clear();
    delay(100);
    lcd.setCursor(0, 0);
    lcd.print("Hello, world!");
    delay(100);
  }
}
