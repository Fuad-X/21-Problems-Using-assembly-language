INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC 
    PRINT "THIS PROGRAME WILL RUN UNTILL A SPACE IS INPUTED : "
    
    MOV AH, 1      ;Input mode select
    
    REPEAT:
    INT 21H        
        
    CMP AL, ' '    ;Compare with AL to space 
    JNE REPEAT     ;If AL is not space the loop will continute
        
    MOV AH, 2
    MOV DX, 0DH               ;Front of line
    INT 21H
    MOV DX, 0AH               ;Next Line
    INT 21H
    
    PRINT "SPACE found in the input."
        
    
    MAIN ENDP
END MAIN
