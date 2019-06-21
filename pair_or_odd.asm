section data
	inNum1 db 'Ingrese el numero para comparar',0xA
	leng_1 equ $-inNum1

	resultado db 'El resultado impar'
	leng_r equ $-resultado
	resultado2 db 'El resultado par'
	leng_r2 equ $-resultado2

section  .bss
	entry resb 1
section .text
	global _start
			_start:
					mov eax, 4 
					mov ebx, 1
					mov ecx, inNum1
					mov edx, leng_1
					int 80h

					mov eax, 3
					mov ebx, 2
					mov ecx, entry
					mov edx, 10
					int 80h

					and eax, 1
					jz par

					mov eax, 4 
					mov ebx, 1
					mov ecx, resultado
					mov edx, leng_r
					int 80h	

					jmp salir

				par:	
					mov eax, 4 
					mov ebx, 1
					mov ecx, resultado2
					mov edx, leng_r2
					int 80h

					mov eax, 4 
					mov ebx, 1
					mov ecx, result
					mov edx, 5
					int 80h
				salir:
					 mov eax, 1
		   		     mov ebx, 0
		   	         int 80h



