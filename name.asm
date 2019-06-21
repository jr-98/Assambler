section data
 	msj db 'Jonathan Ricardo Tillaguango Jiménez', 0ax
 	leng equ $-msj
section .text
	global _start
		   _start:
		   		mov eax, 4
		   		mov ebx, 1
		   		mov ecx, msj
		   		mov edx, leng
		   		int 80h

		   		mov eax, 1
		   		mov ebx, 0  
		   		int 80h

