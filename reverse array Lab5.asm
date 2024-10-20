.MODEL SMALL
.STACK 100H
.DATA 
  A DB 3 DUP(?)     
  STR DB "Enter 3 numbers: $" 
  STR1 DB 13,10, "Reversed: $"
  
.CODE
MAIN PROC 
  MOV AX,@DATA
  MOV DS,AX 
  
  MOV DX,OFFSET STR
  MOV AH,09
  INT 21H
  
  MOV CX,3
  MOV SI,0

INPUT_ARRAY:
  MOV AH,01          
  INT 21H            
  SUB AL,30H         
  MOV A[SI],AL       
  INC SI             
  LOOP INPUT_ARRAY   

  MOV CX,2
  MOV SI,0
  MOV DI,2
  
REVERSE_ARRAY:
  MOV AL,A[SI]
  MOV BL,A[DI]
  MOV A[SI],BL
  MOV A[DI],AL
  INC SI
  DEC DI
  LOOP REVERSE_ARRAY
  
  MOV DX,OFFSET STR1
  MOV AH,09
  INT 21H

  MOV CX,3
  MOV SI,0
  
PRINT_ARRAY:
  MOV AL,A[SI]
  ADD AL,30H         
  MOV DX,0
  MOV DL,AL
  MOV AH,02
  INT 21H            
  INC SI
  LOOP PRINT_ARRAY

  MOV AH,4CH         
  INT 21H

MAIN ENDP
END MAIN