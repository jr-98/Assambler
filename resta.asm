section data
	inNum1 db 'Ingrese el minuendo',0aX
	leng_n1 equ $-inNum1
	inNum2 db 'Ingrese el sustraendo',0aX
	leng_n2 equ $-inNum2
	resultado db 'El resultado es:',0aX
	leng_r equ $-resultado
section  .bss
	ingreso1 resb 1
	ingreso2 resb 1
	dif resb 1
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
				mov ecx, ingreso1
				mov edx, 10
				int 80h

				mov eax, 4 ;sustraendo
				mov ebx, 1
				mov ecx, inNum2
				mov edx, leng_n2
				int 80h

				mov eax, 3 
				mov ebx, 2
				mov ecx, ingreso2
				mov edx, 10
				int 80h

				mov ax,[ingreso1]
				mov bx,[ingreso2]
				sub ax, '0'
				sub bx, '0'
				sub ax, bx
				add ax, '0'

				mov[dif], eax

				mov eax, 4 
				mov ebx, 1
				mov ecx, resultado
				mov edx, leng_r
				int 80h

				mov eax, 4 
				mov ebx, 1
				mov ecx, dif
				mov edx, 1
				int 80h

		         mov eax, 1
       		     mov ebx, 0
       	         int 80h

