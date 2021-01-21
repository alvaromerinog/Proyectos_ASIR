/*
 * Práctica 7 Ejercicio 1
 * Explicación de operadores relacionales y lógicos.
 */
 
byte a=6,b=2;
bool validar=false;

void setup() {
  Serial.begin(9600);
  Serial.print("Valor A: ");
  Serial.println(a);
  Serial.print("Valor B: ");
  Serial.println(b);
  
  /* 
   *  El operador relacional '=' o igual, devuelve true si se cumple elementoA igual a 
   *  elementoB. En caso contrario, devuelve false.
   */
   
  if(a == b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador relacional =");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador relacional '!=' o distinto, devuelve true si se cumple elementoA distinto a 
   *  elementoB. En caso contrario, devuelve false.
   */
   
  if(a != b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador relacional !=");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador relacional '>' o mayor que, devuelve true si se cumple elementoA mayor que 
   *  elementoB. En caso contrario, devuelve false.
   */
   
  if(a > b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador relacional >");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador relacional '<' o menor que, devuelve true si se cumple elementoA menor que 
   *  elementoB. En caso contrario, devuelve false.
   */
   
  if(a < b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador relacional <");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador relacional '>=' o mayor o igual, devuelve true si se cumple elementoA mayor o igual a 
   *  elementoB. En caso contrario, devuelve false.
   */
   
  if(a >= b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador relacional >=");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador relacional '<=' o menor o igual, devuelve true si se cumple elementoA menor o igual a 
   *  elementoB. En caso contrario, devuelve false.
   */
   
  if(a <= b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador relacional <=");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
    * Nota:
    * elementoA + operador relacional + elementoB = Condición
    * 
    * Las condiciones se relacionan entre ellas con operadores lógicos.
    *  
   *  El operador lógico '&&' o y lógico, devuelve true si se cumple condiciónA y, 
   *  a la vez, la condiciónB. En caso contrario, devuelve false.
   */
   
  if(a != b && a >= b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador lógico &&");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador lógico '||' u o lógico, devuelve true si se cumple condiciónA o 
   *  la condiciónB. Puede cumplirse, una, la otra, o las dos a la vez. En caso de 
   *  no cumplirse ninguna de las dos, devuelve false.
   */
   
  if(a <= b || a == b){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador lógico ||");
  Serial.print("Condicion: ");
  Serial.println(validar);
  
   /* 
   *  El operador lógico '!' o no lógico, devuelve true si no se cumple condiciónA. 
   *  En caso contrario, devuelve false. Invierte los resultados.
   */
  if(!(a==b)){
    validar=true;
  }
  else{
    validar=false;
  }
  Serial.println("Operador lógico !");
  Serial.print("Condicion: ");
  Serial.println(validar);
}

void loop() {

}
