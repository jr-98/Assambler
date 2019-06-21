section data
	message db 'Ingrese su nombre', 0ax
	lenght equ $-message
	show db "El nombre ingresado es"
	lenght_p equ $-show
section .bss
	nombre resb 10
section .text
	global _start
                _start:
                	mov eax, 4        ; sys_write syscall
                    mov ebx, 1        ; stdout
                    mov ecx, message    ; message address
                    mov edx, lenght        ; message string
                    int 80h

                    ;lectura
                    mov eax, 3        ; sys_write syscall
                    mov ebx, 2        ; stdout
                    mov ecx, nombre    ; message address
                    mov edx, 10        ; message string length
                    int 80h

                    mov eax, 4
                    mov ebx, 1
                    mov ecx, show
                    mov edx, lenght_p
                    int 80h

                    mov eax, 4
                    mov ebx, 1
                    mov ecx, nombre
                    mov edx, 10
                    int 80h

                    mov eax, 1
                    mov ebx, 0
                    int 80h