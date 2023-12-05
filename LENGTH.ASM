.MODEL SMALL
.DATA 
STRING1 DB 'HELLO$'
STRING2 DB 'LENGTH_OF_STRING:$ '
.CODE
MOV AX,@DATA 
MOV DS,AX
LEA SI,STRING1
MOV CL,0
SCAN:
  MOV AL,[SI]
  CMP AL,'$'
  JZ EXIT
  INC CL
  INC SI
  JMP SCAN

EXIT:
    LEA DX, STRING2  
    MOV AH, 09H      
    INT 21H            
    ADD CL,30H
    MOV DL, CL        
    MOV AH, 02H      
    INT 21H           

    MOV AH, 4CH      
    INT 21H          

END


