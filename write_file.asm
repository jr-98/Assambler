%macro write 2
		mov eax, 4
		mov ebx, 1
		mov ecx, %1
		mov edx, %2
		int 0x80
%endmacro

section .data
	msj db "Leer un archivo en el disco duro",10
	leng_msj equ $-msj
	file db "/home/jonathan/Documents/practicas/Assambler/doc.txt",0
section .bss
	texto resd 15        ;variable que almacena el contenido del archivo
	idarchivo resd 1     ;el identificador que se obtiene del archivo, es el escudo fisico

section .txt
	global _start
			_start:
				mov eax, 8    ;sevicio para abrir el archivo y poder escribir en el 
				mov ebx, file ;La adireccion del archivo
				mov ecx, 1    ;aperation of only read
				mov edx, 200h    ;permission
				int 80h

				test eax, eax
				jz salir

				mov dword[idarchivo], eax

				write msj, leng_msj

				mov eax, 3      ; se lle desde el archivo
				mov ebx, 2
				mov ecx, texto
				mov edx, 10
				int 80h

				mov eax, 4
				mov ebx, [idarchivo]
				mov ecx, texto
				mov edx, 10
				int 80h
		
             
	salir:
	   mov eax, 1
	   mov ebx, 0
	   int 80h