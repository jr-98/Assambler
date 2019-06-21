section data
	inNum1 db 'Ingrese el primer factor',0xA
	leng_n1 equ $-inNum1
	inNum2 db 'Ingrese el segundo factor',0xA
	leng_n2 equ $-inNum2
	resultado db 'El producto es igual = '
	leng_r equ $-resultado
section .bss
	factor1 resb 1
	factor2 resb 1
	producto resb 1
section .text
	global _start
			_start:
			mov eax, 4
			mov ebx, 1
			mov ecx, inNum1
			mov edx, leng_n1
			int 80h

			mov eax, 3
			mov ebx, 2
			mov ecx, factor1
			mov edx, 10
			int 80h
			;end factor 1

			mov eax, 4
			mov ebx, 1
			mov ecx, inNum2
			mov edx, leng_n2
			int 80h

			mov eax, 3
			mov ebx, 2
			mov ecx, factor2
			mov edx, 10
			int 80h ; end f2

			mov ax,[factor1]
			mov bx,[factor2]
			sub ax, '0'
			sub bx, '0'
			mul bx
			add ax, '0'

			mov [producto], eax


			mov eax, 4 
			mov ebx, 1
			mov ecx, resultado
			mov edx, leng_r
			int 80h

			mov eax, 4 
			mov ebx, 1
			mov ecx, producto
			mov edx, 1
			int 80h

	         mov eax, 1
   		     mov ebx, 0
   	         int 80h
