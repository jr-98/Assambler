%macro write 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80 
%endmacro
%macro read 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 0x80 
%endmacro
;_______________________________
section .data
	msj db 'Ingrese 5 numeros y presion enter', 0xA
	leng_msj equ $-msj

	msj2 db 'el numero mayor es:',0xA
	leng_msj2 equ $-msj2

	array db 0,0,0,0,0
	la equ $-array
section .bss
	answer resb 2
section .text
	global _start
			_start:
				mov esi, array ;inicializa eel earreglp
				mov edi, 0
				;-----------message----------
				write msj, leng_msj
			leer:
				read answer,2

				mov al,[answer]
				sub al, '0'                      ; de caracter a int
				mov [esi],al                     ;lo almacena en el areglo
				jb print						 ;cuando lega al limite del array lo imprime 							
				add edi,1                        ;recorre el areglo de elemento a elemento
				add esi,1

				cmp edi, la
				jb leer
				mov ecx, 0
			comparar:
				mov al,[array +ecx]				;desplacxzarce a la posicion del elemento, inicializa en 0
				cmp al, bl
				jb bucle
				mov bl, al
			bucle:
				inc ecx
				cmp ecx, la
				jb comparar
			print:
				add bl,'0'
				mov [answer], bl

				write msj2,leng_msj2
				write answer, 2
			salir:
				mov eax, 1
				mov ebx, 0
				int 80h

