/*
 * Práctica 7 Ejercicio 2
 * Gobierno de tres diodos led mediante introducción de caracteres por consola.
 */
 
byte azul=2,verde=3,rojo=4;
char valor;

void setup(){
  Serial.begin(9600);
  Serial.println("Escribe 'a' para encender el led azul y 'A' para apagarlo.");
  Serial.println("Escribe 'v' para encender el led verde y 'V' para apagarlo.");
  Serial.println("Escribe 'r' para encender el led rojo y 'R' para apagarlo.");
  Serial.println("Escribe 't' para encender todos los leds y 'T' para apagarlos.");
  pinMode(azul,OUTPUT);
  pinMode(verde,OUTPUT);
  pinMode(rojo,OUTPUT);
  digitalWrite(azul,LOW);
  digitalWrite(verde,LOW);
  digitalWrite(rojo,LOW);
}

void loop(){
  if(Serial.available()>0){
    valor = Serial.read();
    /*
     * Al introducir un caracter
     * No inicia la condición cuando llega al salto de línea, 
     * por lo que vacía el buffer y repite.
     */
    if(valor!='\n'){
      Serial.print("Caracter: ");
      Serial.println(valor);
      switch(valor){
        case 'a': 
          digitalWrite(azul,HIGH);
          Serial.println("Led azul encendido");
          break;
        case 'A':
          digitalWrite(azul,LOW);
          Serial.println("Led azul apagado");
          break;
        case 'v':
          digitalWrite(verde,HIGH);
          Serial.println("Led verde encendido");
          break;
        case 'V':
          digitalWrite(verde,LOW);
          Serial.println("Led verde apagado");
          break;
        case 'r':
          digitalWrite(rojo,HIGH);
          Serial.println("Led rojo encendido");
          break;
        case 'R':
          digitalWrite(rojo,LOW);
          Serial.println("Led rojo apagado");
          break;
        case 't':
          digitalWrite(azul,HIGH);
          digitalWrite(rojo,HIGH);
          digitalWrite(verde,HIGH);
          Serial.println("Todos los leds encendidos");
          break;
        case 'T':
          digitalWrite(azul,LOW);
          digitalWrite(rojo,LOW);
          digitalWrite(verde,LOW);
          Serial.println("Todos los leds apagados");
          break;
        default:
          Serial.println("Caracter no válido.");
          break;
      }
    }
  }
}
