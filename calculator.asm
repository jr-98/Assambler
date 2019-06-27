section .data
	inNum1 db 'Ingrese el primer numero', 0xA
	leng_n1 equ $-inNum1
	inNum2 db 'Ingrese el segundo numero',0xA
	leng_n2 equ $-inNum2
	resultado db 'El resultado xxxxxxxxxx'
	leng_r equ $-resultado
section  .bss
	entry1 resb 1
	entry2 resb 1
	result resb 1 
section .text
	global _start:
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

				multiplicar:
					mov ax,[entry1]
					mov bx,[entry2]
					sub ax, '0'
					sub bx, '0'
					mul bx
					add ax, '0'

					mov [result], eax
					mov [resultado + 12],dword 'mlt='

					mov eax, 4 
					mov ebx, 1
					mov ecx, resultado
					mov edx, leng_r
					int 80h

					mov eax, 4 
					mov ebx, 1
					mov ecx, result
					mov edx, 1
					int 80h

					jmp restar
				dividir:
					mov al, [entry1]
					mov bl, [entry2]
					sub al, '0'
					sub bl, '0'
					div bl ;->al/bl
					add al, '0'
					add ah, '0' ;porque almacena tanto el recisup como el cociente al(cociente) ah(resuduo)
					mov [result], al 
					mov [resultado + 12], dword 'div='
	;----------------COCIENTE--------
					mov eax, 4
					mov ebx, 1
					mov ecx, resultado
					mov edx, leng_r
					int 80h

					mov eax, 4
					mov ebx, 1
					mov ecx, result
					mov edx, 1
					int 80h		
					jmp multiplicar
				sumar:
					mov ax,[entry1]
					mov bx,[entry2]
					sub ax, '0'
					sub bx, '0'
					add ax, bx
					add ax, '0'

					mov[result], eax
					mov [resultado + 12], dword 'sum='

					mov eax, 4 
					mov ebx, 1
					mov ecx, resultado
					mov edx, leng_r
					int 80h

					mov eax, 4 
					mov ebx, 1
					mov ecx, result
					mov edx, 1
					int 80h

					jmp salir

				restar:
					mov ax,[entry1]
					mov bx,[entry2]
					sub ax, '0'
					sub bx, '0'
					sub ax, bx
					add ax, '0'

					mov[result], eax
					mov [resultado + 12], dword 'rst='

					mov eax, 4 
					mov ebx, 1
					mov ecx, resultado
					mov edx, leng_r
					int 80h

					mov eax, 4 
					mov ebx, 1
					mov ecx, result
					mov edx, 1
					int 80h
					jmp sumar

				salir:
			         mov eax, 1
		   		     mov ebx, 0
		   	         int 80h

		 