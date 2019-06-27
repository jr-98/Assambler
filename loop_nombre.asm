section .data
	nombre db 10, 'Jonothan n'
	leng equ $-nombre
section .text
	global _start
		_start:
		mov ecx, 9
	l1:
		push ecx
		add ecx, '0'
		mov [nombre + 8], dword ecx
		mov eax, 4
		mov ebx, 1
		mov ecx, nombre
		mov edx, leng
		int 80h
		pop ecx
		loop l1
		jmp salir
	salir:
		mov eax, 1
		mov ebx, 0
		int 80h