section .data
	msj db '*'
section .text
	global _start
	  _start:
		mov ecx, 9
		jmp principal

	principal:
		cmp ecx, 0
		jz salir
		jmp imprimir

	imprimir:
		push ecx
		mov eax, 4
		mov ebx, 1
		mov ecx, msj
		mov edx, 1
		int 80h
		pop ecx
		dec ecx ; ecx = ecx -1
		jmp principal
	salir:
		mov eax, 1
		mov ebx, 0
		int 80h

