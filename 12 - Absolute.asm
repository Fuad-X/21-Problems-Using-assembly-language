INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    MOV BL, 3            ;Setting up BL with 3
    NEG BL               ;Making BL -3 to compare
    
    PRINT "HERE THE VALUE IS : -3"
    
    MOV AH, 2
    MOV DX, 0DH          ;Front of line
    INT 21H
    MOV DX, 0AH          ;Next Line
    INT 21H
    
    MOV AL, BL           ;Moving BL to AL
    
    CMP AL, 0            ;Comparing AL with 0
    JNL EXIT             ;Jump to exit if AL is Less then 0
    
    NEG AL               ;Negeting the value of AL
    
    MOV DL, AL           ;Moving AL to DL
    MOV AH, 2            ;Output Character command
    INT 21H
          
    EXIT:
        MOV AH, 4CH
        INT 21H
 
    MAIN ENDP
END MAIN
