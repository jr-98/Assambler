section data
	msj1 db 'Lenguaje emsamblador', 0ax ;mensaje 1
	msj2 db 'Sexto ciclo' ; mensaje2
	leng1 equ $-msj1
	leng2 equ $-msj2
section .text
	global _start
		_start:
			mov eax, 4
			mov ebx, 1
			mov ecx, msj1
			mov edx, leng1
			int 80h

			mov eax,1
			mov ebx,0
			int 80h
			
			mov eax, 4
			mov ebx, 1
			mov ecx, msj2
			mov edx, leng2
			int 80h


			;returnd code

			mov eax,1
			mov ebx,0
			int 80h