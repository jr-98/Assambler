;Read arcchive_____________________________
%macro write 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro
;Write archive_____________________________
segment .data
new_line db 10, ''
	msj db "Escribiendo en un archivo en el disco duro",0xA
	leng_msj equ $-msj
	file db "/home/jonathanrtj/Documents/texto.txt",0
segment .bss
	result resd 30       ;variable que almacena el contenido del archivo
	idarchivo resd 1     ;el identificador que se obtiene del archivo, es el escudo fisico

segment .text

		global _start
			_start:
		mov ecx,9
			mov ebx,9
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
			dec ebx
			loop l1
		print_enter:
			mov eax, 4
			mov ebx, 1
			mov ecx, new_line
			mov edx,1
			int 80h
			ret
		print_number:
		
				mov eax, 8    		;sevicio para trabajar con el archivo
				mov ebx, file 		;La adireccion del archivo o identificador
				mov ecx, 1  		;MOdo de acceso
				mov edx, 777h    		;permission
				int 80h

				test eax, eax ; el identificador es el objeto tipo archivo
				jz salir

				mov dword [idarchivo], eax	;open file 
				
				write msj, leng_msj

				mov eax, 4
				mov ebx, [idarchivo]  ;input 
				mov ecx, result
				mov edx, 10
				int 80H
				ret

;segment .data
;	msj db "Leer desde un archivo:",0xA
;	leng equ $-msj
;	file db "/home/jonathanrtj/Documents/texto.txt",0
;segment .bss
;	texto resb 30
;	idarchivo resd 1
;segment .text
;	global _start
;		_start:
;			mov eax, 5                   ;servicio para trabajar con archivos, (5) apertura
;			mov ebx, file				 ;la direccion del archivo de una cadena determinada en la cabecera 	
;			mov ecx, 0                   ;Modo de acceso
;		    mov edx, 0			             ;Permisos al archivo, si se abre creandolo
; 			int 0x80					 ; Modos de acceso:
                            			 ; O-RDONLY 0: El archivo se abre sólo para leer de él.
							 			 ; O-WRONLY 1: El archivo se abre sólo para escribir en él.
										 ; O-RDWR 2: El archivo se abre para lectura y escritura.
										 ; O-CREAT 256: Crear el archivo en caso de que no exista.
										 ; O-APPEND 2000h: El archivo se abre sólo para escritura al final, 
										 ; añadiendo información.	
 

;			test eax, eax                ;INstruccion que realiza un comparacin logica "Y" con dos operandos 
										 ; pero NO afecta a ninguno de ellos, SÓLO afecta al registro de estado. Admite 
                         				; todos los tipos de direccionamiento excepto los dos operandos en memoria
				                        ; TEST reg, reg
				                        ; TEST reg, mem
				                        ; TEST mem, reg
				                        ; TEST reg, inmediato
				                        ; TEST mem, inmediato 

;			jz salir

;			mov dword[idarchivo], eax

;			write msj, leng
;			mov eax, 3
;			mov ebx, [idarchivo]
;			mov ecx, texto
;			mov edx, 13
;			int 80h
;
;			write texto, 13

;			mov eax, 6                   ;Servicio de lectura
;			mov ebx, [idarchivo]		 ;Unidad de esntrada
;			mov ecx, 0
;			mov edx, 0
;			int 0x80 
		salir:
			mov eax, 1
			xor ebx, ebx
			int 80h
