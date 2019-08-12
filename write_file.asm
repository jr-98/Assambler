%macro write 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro
;Write archive_____________________________
segment .data
	msj db "Escribiendo en un archivo en el disco duro",0xA
	leng_msj equ $-msj
	file db "/home/jonathanrtj/Documents/texto.txt",0
segment .bss
	texto resd 30       ;variable que almacena el contenido del archivo
	idarchivo resd 1     ;el identificador que se obtiene del archivo, es el escudo fisico

segment .text
			entrada:
				mov eax, 3
				mov ebx, 0
				mov edx, 10
				int 80H
				ret

		global _start
			_start:
				mov eax, 8    		;sevicio para trabajar con el archivo
				mov ebx, file 		;La adireccion del archivo o identificador
				mov ecx, 1  		;MOdo de acceso
				mov edx, 777h    		;permission
				int 80h

				test eax, eax ; el identificador es el objeto tipo archivo
				jz salir

				mov dword [idarchivo], eax	;open file 
				
				write msj, leng_msj

				mov ecx, texto
				call entrada

				mov eax, 4
				mov ebx, [idarchivo]  ;input 
				mov ecx, texto
				mov edx, 10
				int 80H

		
             
	salir:
	   mov eax, 1
	   mov ebx, 0
	   int 80h
