section .data
	new_line db 10, ''

section .bss
	result resb 1
section .text
	global _start
		_start:
			mov ecx,9
			mov ebx,1
;------------imprimir eNTER Y evaluar cada fila
		l1:
			push ecx
			push ebx
			call print_enter ;se reemplaza el valore de cx por enter y el valor de bx por 1
			pop ecx
			mov ebx, ecx
			push ebx
;------------imprimir el numero y evaluar cada columna
		l2:
			push ecx
			add ecx, '0'
			mov [result], ecx
			call print_number ; se reemplaza el valore de cx por number y el valor de bx por 1 
			pop ecx
			loop l2
			;--------fin de l2
			pop ebx
			pop ecx
			inc ebx
			loop l1
		print_enter:
			mov eax, 4
			mov ebx, 1
			mov ecx, new_line
			mov edx,1
			int 80h
			ret
		print_number:
			mov eax, 4
			mov ebx, 1
			mov ecx, result
			mov edx, 1
			int 80h
			ret	
		salir:
			mov eax, 1
			mov ecx, 0
			int 80h
