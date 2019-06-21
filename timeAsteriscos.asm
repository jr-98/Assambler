section data
		asteriscos TIMES 9 DB '*'
section .text
		global _start
				_start:
				mov eax,4 
				mov ebx,1
				mov ecx, asteriscos
				mov edx, 9 ;longitud de las cadenas que se imprimen
				int 80h

				mov eax, 1
				mov ebx, 0 
				int 80h

