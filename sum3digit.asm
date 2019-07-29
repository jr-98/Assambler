%macro write 2
		mov eax, 4
		mov ebx, 1
		mov ecx, %1
		mov edx, %2
		int 0x80
%endmacro
section .data
	msj db "La suma es:"
	leng equ $-msj
	n1 db '487'
	n2 db '276'
	suma db '    '
section .text
	global _start
		_start:
			mov ecx, 3 ; numero de digitos de cada operando
			mov esi, 2 ; source index
			clc 	   ; permite establecer la bandera de carry en 0
ciclo_suma:
		mov al, [n1+esi]; al ser cadena se empieza en 0 y en numeros desde 1
		adc al[n2+esi]

