/*
 * Práctica 7 Ejercicio 3
 * Encendido progresivo de 4 diodos led condicionado por el nivel de luz de la sala.
 */
 
byte azul = 3,verde = 5,rojo = 6,ama = 9,i = 0;
byte ldr = 0;
int valor,umbral = 10;

void setup(){
  Serial.begin(9600);
  pinMode(azul,OUTPUT);
  pinMode(verde,OUTPUT);
  pinMode(rojo,OUTPUT);
  pinMode(ama,OUTPUT);
}

void loop(){
  valor = analogRead(ldr);
  Serial.println(valor);
  while(valor < umbral || (i > 0 && i < 255)){
    analogWrite(azul,i);
    analogWrite(verde,i);
    analogWrite(rojo,i);
    analogWrite(ama,i);
    if(i < 255){
      i += 5;
    }
    valor = analogRead(ldr);
    Serial.println(valor);
    delay(300);
  }
  if(valor > umbral && i == 255){
    i = 0;
    analogWrite(azul,i);
    analogWrite(verde,i);
    analogWrite(rojo,i);
    analogWrite(ama,i);
  }
  delay(300);
}
