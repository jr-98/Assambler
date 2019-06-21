section data
	inNum1 db 'Ingrese el primer numero', 0xA
	leng_n1 equ $-inNum1
	inNum2 db 'Ingrese el segundo numero',0xA
	leng_n2 equ $-inNum2
	resultado1 db 'Es igual'
	leng_r1 equ $-resultado
	resultado2 db 'No es igual'
	leng_r2 equ $-resultado
section  .bss
	entry1 resb 1
	entry2 resb 1
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
					mov ecx, entry1
					mov edx, 10
					int 80h
			       ;-------------------------------end factor 1
					mov eax, 4
					mov ebx, 1
					mov ecx, inNum2
					mov edx, leng_n2
					int 80h

					mov eax, 3
					mov ebx, 2
					mov ecx, entry2
					mov edx, 10
					int 80h ; end f2
					jmp dividir
					mov al, [entry1] 
					mov bl, [entry2]

					sub al, '0'
					sub bl, '0'
					cmp al,bl
					jz print_equals
					jmp print_noEquals

			 print_equals:
			 print_noEquals:
			 salir:

