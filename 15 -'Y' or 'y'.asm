INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    PRINT "PLEASE INSERT A LETTER : "
    
    MOV AH, 1                 ;Set input commnad for character
    INT 21H
    MOV BL, AL                ;Moving AL to BL
    
    MOV AH, 2
    MOV DX, 0DH               ;Front of line
    INT 21H
    MOV DX, 0AH               ;Next Line
    INT 21H
    
    CMP BL, 'Y'               ;Compare BL with 'Y'
    JE PRINT_IT               ;Jump to Print IT if BL = Y
    
    CMP BL, 'y'
    JE PRINT_IT               ;Compare BL with 'Y'
                              ;Jump to Print IT if BL = y
    JMP EXIT
    
    
    PRINT_IT:
        MOV DL, BL            ;Moving BL to DL 
        MOV AH, 2             ;Set Output Command
        INT 21H
    
    EXIT:
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN

