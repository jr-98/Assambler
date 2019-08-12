%macro write 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

segment .data
 	
 	msj2 db "la moda es", 10
 	leng2 equ $-msj2

 	arreglo db 0,0,0,0,0,0,0,0,0,0
 	la equ $-arreglo

 	file db "/home/jonathanrtj/Documents/practicas/Assambler/docExamen7.txt",0
segment .bss
	respuesta resb 30
	arreglo1 resb 30
	idarchivo resd 1
segment .text
	global _start
           _start:
;........... leer el archivo arreglo
					mov esi, arreglo ;inicializa el arreglo 
           			mov edi, 0

					mov eax, 5
					mov ebx, file
					mov ecx, 0
					mov edx, 0
					int 80h

					test eax, eax
					jz salir
				
					mov dword[idarchivo], eax

					mov eax, 3
					mov ebx, [idarchivo]
					mov ecx, respuesta
					mov edx, 13
					int 80h

					write respuesta, 13
					loop almacenar

					mov eax, 6                   ;Servicio de lectura
					mov ebx, [idarchivo]		 ;Unidad de esntrada
					mov ecx, 0
					mov edx, 0
					int 0x80 
					
;........... Fin Lectura de archivo arreglo

				almacenar:
           			mov al,[respuesta]
           			sub al,'0'
           			mov[esi],al
           			jb imprimir

           			add edi, 1
           			add esi, 1

           			cmp edi, la
           			jb almacenar
           			mov ecx, 0

            	imprimir:
           			push ecx
           			mov al,[arreglo + ecx]
           			add al,'0'
           			mov[respuesta],al

           			mov eax, 4
           			mov ebx,1
           			mov ecx, respuesta
           			mov edx, 1
           			int 80h

           			pop ecx
           			inc ecx

           			cmp ecx, la
           			jb imprimir
           		
           		salir:
           			mov eax, 1
           			mov ebx, 0
           			int 80h