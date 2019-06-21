section data
	num db 'ingrese el numero', 0xA
	leng equ $-num

	msj1 db 'Es menor a 5',0xA
	leng1 equ $-msj1

	msj2 db 'Es igual a 5',0xA
	leng2 equ $-msj2

	msj3 db 'Es mayor a 5',0xA
	leng3 equ $-msj3
section .bss
	entry resb 1
section .text
	global _start
			_start:
				mov eax, 4
				mov ebx, 1
				mov ecx, num
				mov edx, leng
				int 80h

				mov eax, 3
				mov ebx, 2
				mov ecx, entry
				mov edx, 10
				int 80h

				mov al, [entry]
				sub al, '0'
				cmp al, 5
				jc menor
				jz igual
				jmp mayor

			menor:
				mov eax, 4 
				mov ebx, 1
				mov ecx, msj1
				mov edx, leng1
				int 80h
				jmp salir
			igual:
				mov eax, 4 
				mov ebx, 1
				mov ecx, msj2
				mov edx, leng2
				int 80h
				jmp salir
			mayor:
				mov eax, 4 
				mov ebx, 1
				mov ecx, msj3
				mov edx, leng3
				int 80h
				jmp salir
			salir:
				  mov eax, 1
	   		     mov ebx, 0
	   	         int 80h
