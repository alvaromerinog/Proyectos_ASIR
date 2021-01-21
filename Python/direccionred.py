''' Así es como funciona ip.split(".")
def capturar(ip):
    i=0
    x=""
    a=[]
    while len(ip) > i:
        if ip[i]=="." or i==len(ip)-1:
            a.add(x)
            x=""
        else:
            x+=ip[i]
        ++i
    return a
'''
def comparar(ip1,a,ip2):
	r=True
	for i in range(len(ip1)):
		if ip1[i] != ip2[i]:
			if a!=4:
				if i!=a:
					r=False
					break
			else:
				r=False
				break
	return r
def tipo(a):
	if 0<=a<=127:
		a=1
		print("La dirección IP es de clase A")
	elif 128<=a<=191:
		a=2
		print("La dirección IP es de clase B")
	elif 192<=a<=223:
		a=3
		print("La dirección IP es de clase C")
	elif 224<=a<=239:
		a=4
		print("La dirección IP es de clase D")
	elif 240<=a<=255:
		a=4
		print("La dirección IP es de clase E")
	return a
ip1=input("Escriba la primera dirección IP: ")
ip1=ip1.split(".")
a=tipo(int(ip1[0]))
ip2=input("Escriba la segunda dirección IP: ")
ip2=ip2.split(".")
b=tipo(int(ip2[0]))
r=False
if(a!=b):
	print("¿Estan en la misma red?: ",r)
else:
	r=comparar(ip1,a,ip2)
	print("¿Estan en la misma red?: ", r)
