.MODEL SMALL
.STACK 100H
.DATA
A DB 5 DUP(?)
SUM DB 0
MIN DB 0
MAX DB 0
STR1 DB "Enter 5 numbers: $"
STR2 DB "Sum of the given numbers is: $"
STR3 DB "Max of the given numbers is: $"
STR4 DB "Min of the given numbers is: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
    MOV DX, OFFSET STR1
    MOV AH, 9
    INT 21H
    CALL NEWLINE

    MOV CX, 0
    MOV CL, 5
    MOV SI, 0

INPUT:
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV A[SI], AL
    INC SI
    LOOP INPUT
    CALL NEWLINE

    CALL SUM1
    MOV DX, OFFSET STR2
    MOV AH, 9
    INT 21H
    MOV DL, SUM
    MOV AH, 2
    INT 21H
    CALL NEWLINE

    CALL MAX1
    MOV DX, OFFSET STR3
    MOV AH, 9
    INT 21H
    MOV DL, MAX
    MOV AH, 2
    INT 21H
    CALL NEWLINE

    CALL MIN1
    MOV DX, OFFSET STR4
    MOV AH, 9
    INT 21H
    MOV DL, MIN
    MOV AH, 2
    INT 21H
    CALL NEWLINE

    MOV AH, 4CH
    MOV AL, 00
    INT 21H

MAIN ENDP

NEWLINE PROC
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    RET
NEWLINE ENDP

SUM1 PROC
    MOV CX, 5
    MOV SI, 0
    MOV AL, 0

LOOP1:
    ADD AL, A[SI]
    INC SI
    LOOP LOOP1

    ADD AL, 30H
    MOV SUM, AL
    RET
SUM1 ENDP
 
MAX1 PROC
    MOV SI, 0
    MOV AL, A[SI]
    MOV MAX, AL
    INC SI

FIND_MAX:
    MOV AL, A[SI]
    CMP AL, MAX
    JLE CONTINUE_MAX
    MOV MAX, AL

CONTINUE_MAX:
    INC SI
    CMP SI, 5
    JL FIND_MAX
    ADD MAX, 30H
    RET
MAX1 ENDP

MIN1 PROC
    MOV SI, 0
    MOV AL, A[SI]
    MOV MIN, AL
    INC SI

FIND_MIN:
    MOV AL, A[SI]
    CMP AL, MIN
    JGE CONTINUE_MIN
    MOV MIN, AL

CONTINUE_MIN:
    INC SI
    CMP SI, 5
    JL FIND_MIN
    ADD MIN, 30H
    RET
MIN1 ENDP

END MAIN
