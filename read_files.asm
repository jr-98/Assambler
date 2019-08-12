%macro write 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro
segment .data
	msj db "Leer desde un archivo:",0xA
	leng equ $-msj
	file db "/home/jonathanrtj/Documents/texto.txt",0
segment .bss
	texto resb 30
	idarchivo resd 1
segment .text
	global _start
		_start:
			mov eax, 5                   ;servicio para trabajar con archivos, (5) apertura
			mov ebx, file				 ;la direccion del archivo de una cadena determinada en la cabecera 	
			mov ecx, 0                   ;Modo de acceso
		    mov edx, 0			             ;Permisos al archivo, si se abre creandolo
 			int 0x80					 ; Modos de acceso:
                            			 ; O-RDONLY 0: El archivo se abre sólo para leer de él.
							 			 ; O-WRONLY 1: El archivo se abre sólo para escribir en él.
										 ; O-RDWR 2: El archivo se abre para lectura y escritura.
										 ; O-CREAT 256: Crear el archivo en caso de que no exista.
										 ; O-APPEND 2000h: El archivo se abre sólo para escritura al final, 
										 ; añadiendo información.	
 

			test eax, eax                ;INstruccion que realiza un comparacin logica "Y" con dos operandos 
										 ; pero NO afecta a ninguno de ellos, SÓLO afecta al registro de estado. Admite 
                         				; todos los tipos de direccionamiento excepto los dos operandos en memoria
				                        ; TEST reg, reg
				                        ; TEST reg, mem
				                        ; TEST mem, reg
				                        ; TEST reg, inmediato
				                        ; TEST mem, inmediato 

			jz salir

			mov dword[idarchivo], eax

			write msj, leng
			mov eax, 3
			mov ebx, [idarchivo]
			mov ecx, texto
			mov edx, 13
			int 80h

			write texto, 13

			mov eax, 6                   ;Servicio de lectura
			mov ebx, [idarchivo]		 ;Unidad de esntrada
			mov ecx, 0
			mov edx, 0
			int 0x80 
             
	salir:
	   mov eax, 1
	   mov ebx, 0
	   int 80h
