section data
	dividendo db 'Ingrese el primer numero', 0xA ;nx
	len_n1 equ $-dividendo
	divisor db 'Ingrese el segundo numero', 0xA ;n2
	len_n2 equ $-divisor
	msj_cociente db 'El cociente es = ' ;resultado
	len_cos equ $-msj_cociente
	msj_residuo db 'El residuo es = ';resultado
	len_res equ $-msj_residuo
section  .bss
	ingreso1 resb 1
	ingreso2 resb 1
	cociente resb 1
	residuo resb 1
section .text
	global _start
			_start:
				mov eax, 4
				mov ebx, 1
				mov ecx, dividendo
				mov edx, len_n1
				int 80h

				mov eax, 3
				mov ebx, 2
				mov ecx, ingreso1
				mov edx, 10
				int 80h
	
				mov eax, 4
				mov ebx, 1
				mov ecx, divisor
				mov edx, len_n2
				int 80h

				mov eax, 3
				mov ebx, 2
				mov ecx, ingreso2
				mov edx, 10
				int 80h
				;end n2

				mov al, [ingreso1]
				mov bl, [ingreso2]
				sub al, '0'
				sub bl, '0'
				div bl ;->al/bl
				add al, '0'
				add ah, '0' ;porque almacena tanto el recisup como el cociente al(cociente) ah(resuduo)
				mov [cociente], al ;--------------------------------------^^
				mov [residuo], ah ;-----------------------------------------------------------^^
;----------------COCIENTE--------
				mov eax, 4
				mov ebx, 1
				mov ecx, msj_cociente
				mov edx, len_cos
				int 80h

				mov eax, 4
				mov ebx, 1
				mov ecx, cociente
				mov edx, 1
				int 80h		
;____________________RESIDUO_______
				mov eax, 4
				mov ebx, 1
				mov ecx, msj_residuo
				mov edx, len_res
				int 80h

				mov eax, 4
				mov ebx, 1
				mov ecx, residuo
				mov edx, 1
				int 80h	

				mov eax, 1
				mov ebx, 0
				int 80h








