segment .data
	msj db "Ingrese 5 numeros y presione enter",10
	leng equ $-msj
 	
 	msj2 db "el numero mayor es", 10
 	leng2 equ $-msj2

 	arreglo db 0,0,0,0,0
 	la equ $-arreglo

segment .bss
	respuesta resb 2
segment .text
	global _start
           _start:
           			mov esi, arreglo ;inicializa el arreglo, este es el primcipal
           			mov edi, 0
           			;imprimir los mensajes 

           			mov eax, 4
           			mov ebx,1
           			mov ecx, respuesta
           			mov edx, 2
           			int 80h

           		leer:

           			mov eax, 3
           			mov ebx,1
           			mov ecx, respuesta
           			mov edx, 2
           		    int 80h

           			mov al,[respuesta]
           			sub al,'0'
           			mov[esi],al
           			jb imprimir

           			add edi, 1
           			add esi, 1

           			cmp edi, la
           			jb leer
           			mov ecx, 0
              comparar:
                mov al,[arreglo + ecx]
                cmp al, bl
                jb bucle
                mov bl, al
              bucle:  
                inc ecx
                cmp ecx,la
                jb comparar
              imprimir:
                add bl,'0'
                mov [respuesta],bl

                mov eax, 4
                mov ebx, 1
                mov ecx, msj2
                mov edx, leng2
                int 80h

                mov eax, 4
                mov ebx, 1
                mov ecx, respuesta
                mov edx, 2
                int 80h  
           		salir:
           			mov eax, 1
           			int 80h