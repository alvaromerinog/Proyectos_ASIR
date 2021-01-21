byte entrada = 12,led1 = 13;

void setup() {
  Serial.begin(9600);
  pinMode(entrada,INPUT);
  pinMode(led1,OUTPUT);
  digitalWrite(led1,LOW);
}

void loop() {
  digitalWrite(led1,digitalRead(entrada));
}
