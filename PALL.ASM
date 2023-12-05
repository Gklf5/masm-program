.MODEL SMALL

PRINTN MACRO P 
    LEA DX,P 
    MOV AH,09H
    INT 21H
ENDM

.DATA 
    MYSTRING DB 20,?
    STRING3 DB 'ENTER STRING:$'
    STRING1 DB 10,13,'NOT PALLINDROME$'
    STRING2 DB 10,13,'IT IS A PALLINDROME$'

.CODE 
    MOV AX,@DATA
    MOV DS,AX

    PRINTN STRING3

    LEA DX,MYSTRING ; TO STORE IN ADDRESS
    MOV AH,0AH ; TO INPUT STRING
    INT 21H

    ; Display the entered string

    LEA DI,MYSTRING+2; LOAD IN DESTINATION INDEX
    MOV SI,DI

    BACK:
        MOV AL,[DI]
        CMP AL,13
        JZ SCAN
        INC DI
        JMP BACK

    SCAN:
        DEC DI 
        CMP SI,DI 
        JNC OUT1 ; (SI-DI) NO CARRY IF SI>=DI -> PRINT PALLINDROME

        MOV AL, [SI]
        CMP AL, [DI]
        JNZ OUT2 ; [SI] != [DI] -> NOT PALL

        INC SI
        JMP SCAN

    OUT1:
        PRINTN STRING2
        JMP EXIT

    OUT2:
        PRINTN STRING1

    EXIT:
        MOV AH,4CH
        INT 21H
        END