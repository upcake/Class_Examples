int RedPin = 3;
int GreenPin = 6;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(RedPin, OUTPUT);
  pinMode(GreenPin, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  analogWrite(RedPin, 100);   // turn the LED on (HIGH is the voltage level)
  delay(100);                       // wait for a second
  analogWrite(RedPin, 150);   // turn the LED on (HIGH is the voltage level)
  delay(100);                       // wait for a second
  analogWrite(RedPin, 255);   // turn the LED on (HIGH is the voltage level)
  delay(100);
  analogWrite(RedPin, 0);   // turn the LED on (HIGH is the voltage level)
  delay(100);

  analogWrite(GreenPin, 100);   // turn the LED on (HIGH is the voltage level)
  delay(100);                       // wait for a second
  analogWrite(GreenPin, 150);   // turn the LED on (HIGH is the voltage level)
  delay(100);                       // wait for a second
  analogWrite(GreenPin, 255);   // turn the LED on (HIGH is the voltage level)
  delay(100);
  analogWrite(GreenPin, 0);   // turn the LED on (HIGH is the voltage level)
  delay(100);
}
