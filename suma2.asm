section .data
	numN1 dd 10, "Ingrese el numero 1: ", 10
	leng1 EQU $ -numN1
	numN2 dd 10, "Ingrese el numero 2: ", 10
	leng2 EQU $ -numN2
	resultado dd 10, "La suma es: ", 10, "	", 10
	leng_s EQU $ -resultado
	resultRest dd 10, "La resta es: ", 10, "	", 10
	leng_r EQU $ -resultRest
section .bss
	n1 resd 1
	n2 resd 1
	suma resd 1
	resta resd 1	
	
section .text
	global _start
			_start:
				mov eax, 4		
				mov ebx, 1
				mov ecx, numN1
				mov edx, leng1
				int 80H

				mov eax, 3
				mov ebx, 2
				mov ecx, n1
				mov edx, 4
				int 80H

				mov eax, 4
				mov ebx, 1
				mov ecx, numN2
				mov edx, leng2
				int 80H

				mov eax, 3
				mov ebx, 2
				mov ecx, n2
				mov edx, 4
				int 80h

				jmp sum
			sum:
				mov al, [n1 + 0]
				mov bl, [n2 + 0]
				sub al, '0'
				sub bl, '0' 
				add al, bl 
			
				mov bl, al
				mov al, [n1+1]
				mov cl, [n2+1]
				sub ah, '0'
				sub bh, '0' 
				adc al, cl 
				add dword [suma+4], 10
				mov bh,al
				mov [suma], bh

				mov eax, 4
				mov ebx, 1
				mov ecx, resultado
				mov edx, leng_s
				int 80H
				
				mov eax, 4
				mov ebx, 1
				mov ecx, suma
				mov edx, 1
				int 80H

				jmp rest
			rest:
				mov al, [n1+0]
				mov bl, [n2+0]
				sub al, '0'
				sub bl, '0' 
				sbb al, bl 
				add dword [resta+4], 10
				add al, '0' 
				mov [resta], al
				
				mov eax, 4
				mov ebx, 1
				mov ecx, resultRest
				mov edx, leng_r
				int 80H
				
				mov eax, 4
				mov ebx, 1
				mov ecx, resta
				mov edx, 1
				int 80H

				mov ah, [n1+1]
				mov bh, [n2+1]
				sub ah, '0'
				sub bh, '0' 
				sbb ah, bh 
				add dword [resta+4], 10
				add ah, '0' 
				mov [resta], ah
				
				mov eax, 4
				mov ebx, 1
				mov ecx, resta
				mov edx, 1
				int 80h

				jmp salir	
			salir:
				mov eax, 1
				mov ebx, 0
				int 80H	