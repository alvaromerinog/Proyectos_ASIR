void setup(){
Serial.begin(9600);
for(byte i=13;i>=8;i--){
  pinMode(i,OUTPUT);
  digitalWrite(i,LOW);
}
}
void loop(){
for(byte i=13;i>=8;i--){
  digitalWrite(i,HIGH);
  Serial.println(i," encendido");
  delay(1000);
}
for(byte j=8;j<=13;j++){
  digitalWrite(j,LOW);
  Serial.println(j," apagado");
  delay(1000);
}
}
