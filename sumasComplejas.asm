;487+276 =763

%macro escribir 2
   mov eax,4
   mov ebx,1
   mov ecx,%1
   mov edx,%2
   int 80h
%endmacro

section .data
	msj db 'la suma es: ' 
	len equ $ -msj
	n1 db '487'
	n2 db '276'
	suma db ' '
section .text
	global _start
	
_start:
	mov ecx, 3 ; numero de digitos de cada operando
	mov esi, 2 ; fuente indice
	clc        ; permite poner la bamdera del carri en 0 o apagada, siempre hay que poner para que empiecen las banderas apagadas
	

ciclo_suma:
	;al ser cadena se empieza con 0
	mov al,[n1+esi]  ; las suma se la hace en la parte baja y nos colocamos en la ultima posicion
	adc al,[n2+esi]  ; adc activa el carri.... hace l suma normal + el carry, es decir al(7)+n2+esi(6)+cf
	aaa		 ; ajusta la suma cuando exite un carri
			 ; suma a AL 6 digitos y AH 1 suma el acarreo
			 ; se aplica despues de una suma con carreo 
			 ; y suma el contenido de la bandera de carry 
			 ; al primer operando y despues al segundo
	
	
	pushf		;push flat, guarda el estado de todas las banderas ala pila, es necesario ver el orden de las banderas
	or al, 30h      ;convierte de un caracter a un decimal, es similar sub al,'0'
	popf		; restaura le estado de las baderas de la pila hacia las banderas

       	mov[suma+esi],al
        dec esi
        loop ciclo_suma
        escribir msj,len
	escribir suma,3
	
        mov eax,1
        int 80h
      
	

