.MODEL SMALL

PRINTN MACRO P 
    LEA DX,P
    MOV AH,09H
    INT 21H
ENDM

.DATA 
STRING DB 10,13,"SUM OF EVEN NUMBERS IS:$"

.CODE 
MOV AX, @DATA
MOV DS, AX

PRINTN STRING

MOV AL, 0     ; Initialize counter for counting numbers
MOV DL, 0     ; Initialize sum
MOV CL, 10    ; Loop count

TEST_LOOP:
    TEST AL, 1  ; Check the LSB (least significant bit) for even
    JNZ NOT_EVEN; Jump if the number is not even
    ADD DL, AL  ; Add even number to the sum
    DEC CL 

NOT_EVEN:
    INC AL      ; Increment the counter   
    CMP CL, 0   ; Check if the loop should continue
    JG TEST_LOOP ; Jump to the next iteration if CL > 0

DISPLAY:
    MOV CL, 10      ; Set CL to 10 for division
    MOV AL, DL      ; Move the two-digit number to AL
    MOV AH, 0       ; Clear AH to ensure it doesn't affect the division
    DIV CL          ; Divide AL by CL; quotient in AL, remainder in AH

    MOV BH, AH     

    ADD AL, '0'     
    MOV DL, AL      
    MOV AH, 02H    
    INT 21H         

    MOV AL, BH      
    ADD AL, '0'    
    MOV DL, AL      
    MOV AH, 02H    
    INT 21H         

    MOV AH, 4CH
    INT 21H        

EXIT:
    MOV AH, 4CH
    INT 21H
    END