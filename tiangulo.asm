section .data
	asteriscos db '*'
	nueva_linea db 10, ' '
section .text
	
	global _start
		_start:
		mov ecx, 30
		mov ebx, 1
	l1:
		;permite llamar al procedimiento imprimir enter
		push ecx
		push ebx
		call imprimir_enter
		pop ecx
		mov ebx, ecx
		push ebx
	l2:
		push ecx
		call imprimir_asterisco
		pop ecx
		loop l2
		pop ebx
		pop ecx
		inc ebx
		loop l1
		jmp salir
	imprimir_asterisco:
		;permite llamr al procedimintoe imprimif _astericos	
		mov eax, 4
		mov ebx, 1
		mov ecx, asteriscos
		mov edx, 1
		int 80h
		ret 
	imprimir_enter:
		mov eax, 4
		mov ebx, 1
		mov ecx, nueva_linea
		mov edx, 1
		int 80h
		ret 
	salir:
	   mov eax, 1
	   mov ebx, 0
	   int 80h
