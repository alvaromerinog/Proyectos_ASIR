byte ldr=5,led=11;
int valor;

void setup(){
	Serial.begin(9600);
	pinMode(led,OUTPUT);
}

void loop(){
	byte i=0;
	analogWrite(led,i);
	valor=analogRead(ldr);
	Serial.println(valor);
	while(valor<30){
		analogWrite(led,i);
		valor=analogRead(ldr);
		Serial.println(valor);
		if(i<254){
			++i;
		}
		delay(100);
	}
}
