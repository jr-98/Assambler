section data
	%assign numero 0
	%assign asterisco '*'
	%assign salida 4

	msj db "Hola clase",asterisco,asterisco,asterisco,asterisco,asterisco,asterisco,0xA
section .text
	global _start
			_start:
			mov eax, 4  
			mov ebx, 1  
			mov ecx, msj   
			mov edx, 20 
			int 80h

			mov eax, 1
			mov ebx, 0
			int 80h