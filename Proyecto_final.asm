ORG 100H

jmp inicio
   mensage  DB  "La hora de sistema: $"     
   formato    DB  "00:00:00$"        ; formato hora hrz:min:sec

inicio: 
    MOV BX, formato  
    MOV DX, mensage                 
    MOV AH, 09H                  ;Funcion de mostrar texto en pantalla 
    INT 21H                  

    CALL obtener_hora                ;se llama función

    MOV DX, formato                 
    MOV AH, 09H                  ;Funcion de mostrar texto en pantalla 
    INT 21H                      

    MOV AH, 4CH                  
    INT 21H

obtener_hora:
    MOV AH, 2CH                   ;se optiene hora del sistema
    INT 21H                       

    MOV AL, CH                    ;se asigna las horas a AL
    CALL convertir                ; call the procedure CONVERT
    MOV [BX], AX                  ; set [BX]=hr  , [BX] is pointing to hr
                                  ; in the string TIME

    MOV AL, CL                    ; set AL=CL , CL=minutes
    CALL convertir                ; call the procedure CONVERT
    MOV [BX+3], AX                ; set [BX+3]=min  , [BX] is pointing to min
                                  ; in the string TIME
                                           
    MOV AL, DH                    ; set AL=DH , DH=seconds
    CALL convertir                ; call the procedure CONVERT
    MOV [BX+6], AX                ; set [BX+6]=min  , [BX] is pointing to sec
                                  ; in the string TIME
                                                      
    RET                           ;retorna la llamada del procedimiento

convertir:

    MOV AH, 0                     ; set AH=0
    MOV DL, 10                    ; set DL=10
    DIV DL                        ; set AX=AX/DL
    OR AX, 3030H                  ; convert the binary code in AX into ASCII

    RET                           ; return control to the calling procedure