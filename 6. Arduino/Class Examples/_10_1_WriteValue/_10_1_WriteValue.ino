void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0){
    int readByte = Serial.read();
    //readByte *= 2;
    Serial.write(readByte);
    delay(100);
  }
}
