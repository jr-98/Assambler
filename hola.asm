section .data
	msj db 'Hola, Emsamblador',0xa; inicio de comentario
	leng equ $-msj

section .text
	global _start
		_start:
			mov eax, 4  ;Guarda el tipo de operacion basado en la interrrupcion 80
			mov ebx, 1  ; EStablece el tipo de impresion, en este caso es simple
			mov ecx, msj  ; Registro que contiene el valor a imprimir
			mov edx, leng  ; tamaño de cadena o numero de caracteres a definir
			int 80h

			mov eax, 1  ;retorna la ensamblado o termina el proce so
			mov ebx, 0  ;sxsssssss
			int 80h 