section .data
	num db 'ingrese el numero'
	leng equ $-num
	msj db 'el fatorial es xxx'
	lemg_msj equ $-msj
section .bss
    n resb 1
    result resb 1
section .text
		global _start
		   _start:

		    mov eax, 4  
		    mov ebx, 1
		    mov ecx,num
		    moc edx, leng
		    int 80h

		    mov eax, 3  
		    mov ebx, 2
		    mov ecx, n
		    moc edx, 10
		    int 80h
		    mov cx, 1
		    jmp principal
		  principal:
			  cmp cx, 0
			  jz imprimir
			  jmp multi
		  multi:
		    push ax
		    mov ax, [n]
		    mov bx, cx
		    sub ax, '0'
		    sub bx, '0'
		    push ax
			pop ax
			pop cx
			dec cx
	 	  jmp principal
		  imprimir:
		  	

		  salir:
		    mov eax, 1
			mov ebx, 0
			int 80
