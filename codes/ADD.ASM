.MODEL SMALL
PRINTN MACRO P
LEA DX,P 
MOV AH,09H
INT 21H
ENDM
.DATA
MSG1 DB 10,13,'FIRST NUMBER:$'
MSG2 DB 10,13,'SECOND NUMBER:$'
MSG3 DB 10,13,'RESULT:$'
.CODE
MOV AX,@DATA
MOV DS,AX
PRINTN MSG1
MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
PRINTN MSG2
MOV AH,01H
INT 21H
SUB AL,30H
ADD AL,BL
PRINTN MSG3
MOV CL,0AH
MOV AH,00H
DIV CL
MOV BH,AH
ADD AL,30H
MOV DL,AL
MOV AH,02H
INT 21H
ADD BH,30H
MOV DL,BH
INT 21H
MOV AH,4CH
INT 21H
END 