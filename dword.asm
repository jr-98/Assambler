section data 
	msj db "hola clase", 0xA
	leng equ $-msj
section .text
	global _start
			_start:
				mov eax, 4
				mov ebx, 1
				mov ecx, msj
				mov edx, leng
				int 80h

				mov [msj], dword "mala"
				mov eax, 4
				mov ebx, 1
				mov ecx, msj
				mov edx, leng
				int 80h

