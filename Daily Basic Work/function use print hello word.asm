.Model SMALL
.STACK 100H
.DATA
STR DB "Hello World$"

.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX,OFFSET STR
    CALL OUTPUT
    
    
    MOV AH, 4CH ;HOLD
    MOV AL, 00   
    INT 21H
    
    
    
    MAIN ENDP 
OUTPUT PROC 
    
    MOV AH, 9
    INT 21H
    
    
    RET
    
    OUTPUT ENDP
END MAIN