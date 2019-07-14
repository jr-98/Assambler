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
           			mov esi, arreglo ;inicializa el arreglo 
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

            	imprimir:
           			push ecx
           			mov al,[arreglo + ecx]
           			add al,'0'
           			mov[respuesta],al

           			mov eax, 4
           			mov ebx,1
           			mov ecx, respuesta
           			mov edx, 1
           			int 80h

           			pop ecx
           			inc ecx

           			cmp ecx, la
           			jb imprimir
           		salir:
           			mov eax, 1
           			int 80h