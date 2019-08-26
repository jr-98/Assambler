%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
%macro leer 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	coma db ", "
	espacio db "", 10
	len_esp EQU $ -espacio
	menu4 db "         SELECCIONE EL TIEMPO EN SEGUNDOS: ", 10,"1--> 5 SEGUNDOS", 10, "2--> 10 SEGUNDOS",10,"4--> SALIR",9,"", 10,0
	len_menu4 EQU $ -menu4
	seg5 EQU 6
	seg10 EQU 9
	timeval:
	tv_sec  dd 0
	tv_usec dd 0
	
section .bss
	opcion resb 2
	aux rest 2
section .text
	global _start
	
_start:

menu_principal:
	imprimir menu4, len_menu4
	leer opcion,2
	
	mov al, [opcion]
	sub al, '0'
	cmp al, 1 
	jz opcion1

	cmp al, 2 
	jz opcion2

	jmp salir

;5 segundos
opcion1:
	mov ecx,1
	jmp tiempo
	
;10 segundos
opcion2:
	mov ecx,seg10
	jmp tiempo

tiempo:

	push ecx
	add ecx,'0'
	mov [aux], ecx
	imprimir aux,2
	imprimir coma,2
	mov dword [tv_sec], 1
	mov dword [tv_usec], 0
	mov eax, 162
	mov ebx, timeval
	mov ecx, 0
	int 0x80

	pop ecx
	inc ecx
	cmp ecx,seg5
	jz salir
	jmp tiempo

;OPCION SALIR
salir:
	mov eax, 1
	int 80H