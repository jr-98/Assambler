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
				mov eax, 5    ;sevicio para abrir el archivo
				mov ebx, file ;L adireccion del archivo o identificador
				mov ecx, 0    ;aperation of only read
				mov edx, 0    ;permission
				int 80h

				test eax, eax ; el identificador es el objeto tipo archivo
				jz salir

				mov dword [idarchivo], eax	;open file 
				
				write msj, leng_msj

				mov eax, 3 
				mov ebx, [idarchivo] ;input 
				mov ecx, texto
				mov edx, 20
				int 80h
				write texto, 25
		
				mov eax, 6              ;clese file
				mov ebx, [idarchivo]
				mov ecx, 0
				mov ebx, 0
				int 80h
             
	salir:
	   mov eax, 1
	   mov ebx, 0
	   int 80h