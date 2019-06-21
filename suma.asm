section data
	inNum1 db 'Ingrese el primer numero', 0xA ;nx
	len_n1 equ $-inNum1
	inNum2 db 'Ingrese el segundo numero', 0xA ;n2
	len_n2 equ $-inNum2
	resultado db 'El resultado es', 0xA ;resultado
	len_r equ $-resultado

section  .bss
	ingreso1 resb 1
	ingreso2 resb 1
	suma resb 1
section .text 
	global _start
				_start:
						;n1
						mov eax, 4
						mov ebx, 1
						mov ecx, inNum1
						mov edx, len_n1
						int 80h

						mov eax, 3
						mov ebx, 2
						mov ecx, ingreso1
						mov edx, 10
						int 80h

						;end n1
						;n2
						mov eax, 4
						mov ebx, 1
						mov ecx, inNum2
						mov edx, len_n2
						int 80h

						mov eax, 3
						mov ebx, 2
						mov ecx, ingreso2
						mov edx, 10
						int 80h
						;end n2

						mov ax,[ingreso1]
						mov bx,[ingreso2]
						sub ax, '0'
						sub bx, '0'
						add ax, bx
						add ax, '0'

						mov[suma], eax

						mov eax, 4 
						mov ebx, 1
						mov ecx, resultado
						mov edx, len_r
						int 80h

						mov eax, 4 
						mov ebx, 1
						mov ecx, suma
						mov edx, 1
						int 80h

				         mov eax, 1
               		     mov ebx, 0
               	         int 80h




