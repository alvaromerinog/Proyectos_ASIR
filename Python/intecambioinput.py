a=int(input("Introduce el primer numero: "))
b=int(input("Introduce el segundo numero: "))
print("a=",a,"b=",b) # Saca las variables iniciales por pantalla
a^=b # El ^ indica la operación XOR y se ejecuta teniendo ambos números en binario. Además, la ejecución de dicha operación se guarda en a, por lo que ahora a será el "factor de intercambio" entre las variables, el cual es 011.
b^=a # Ahora b es el valor inicial de a
a^=b # Ahora a es el valor inicial de b
print("a=",a,"b=",b) # Saca las variables intercambiadas por pantalla
