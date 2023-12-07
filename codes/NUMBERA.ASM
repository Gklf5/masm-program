;PROGRAM TO FIND NUMBER OF 'A' IN INPUT STRING.

.MODEL SMALL

PRINTS MACRO P
    LEA DX,P
    MOV AH,09H
    INT 21H
ENDM

.DATA
STRING DB 20,?         ; Buffer to store the input string
STRING1 DB "ENTER A STRING:$"
STRING2 DB "NO. OF A'S IN STRING IS $"
NUMBER DW 0            ; Variable to store the count of 'A's

.CODE
MOV AX,@DATA
MOV DS,AX

PRINTS STRING1

MOV AH,01H            ; DOS function to read a character
READ:
INT 21H
CMP AL,13             ; Check if the user pressed Enter
JE DISPLAY            ; If Enter, go to display
CMP AL,'A'            ; Check if the character is 'A'
JNE NEXT              ; If not 'A', jump to NEXT
INC NUMBER            ; Increment the count of 'A's
NEXT:
JMP READ              ; Repeat the loop

DISPLAY:
PRINTS STRING2       ; Print the header
MOV AH,02H           ; DOS function to print a character
MOV DX,NUMBER        ; Move the count of 'A's to DX
ADD DX,'0'           ; Convert to ASCII
INT 21H              ; Print the count

EXIT:
MOV AH,4CH           ; DOS function to exit the program
INT 21H
END
