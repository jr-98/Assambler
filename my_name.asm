section .data
	msj db 'JOnathan', 0xA
	nueva_linea db 10, ' '
	leng equ $-msj
section .text
	global _start
           _start:
           mov ecx, 9
           mov ebx, 1 
         	
           print: 
            push ecx
            mov eax, 4
            mov ebx, 1
            mov ecx, msj
            mov edx, leng
            int 80h
            call imprimir_enter
            pop ecx
            loop print

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





