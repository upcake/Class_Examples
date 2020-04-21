int red = 9;
int blue = 10;
int green = 11;

int switch01 = 3;
int switch02 = 4;
int switch03 = 5;

void setup() {
  Serial.begin(9600);
  
  pinMode(red, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(switch01, INPUT);
  pinMode(switch02, INPUT);
  pinMode(switch03, INPUT);
}

void loop() {
  Serial.print("switch01 : ");
  Serial.print(digitalRead(switch01));
  Serial.print("    switch02 : ");
  Serial.print(digitalRead(switch02));
  Serial.print("    switch03 : ");
  Serial.println(digitalRead(switch03));

  if(digitalRead(switch01) == 1) {
    digitalWrite(red, HIGH);
    digitalWrite(green, LOW);
    digitalWrite(blue, LOW);
  }
  if(digitalRead(switch02) == 1) {
    digitalWrite(red, LOW);
    digitalWrite(green, HIGH);
    digitalWrite(blue, LOW);
  }
  if(digitalRead(switch03) == 1) {
    digitalWrite(red, LOW);
    digitalWrite(green, LOW);
    digitalWrite(blue, HIGH);
  }
}
