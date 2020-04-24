int Pin1 = 10;

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);

  pinMode(A0, INPUT);
  pinMode(Pin1, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {

   int tempVal = analogRead(A0);
   int val = map(tempVal, 0, 1023, 0, 255);  

   Serial.println(val); 

   analogWrite(Pin1, val);
 
}
