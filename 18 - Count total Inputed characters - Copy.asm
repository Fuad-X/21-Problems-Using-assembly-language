INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    MOV DL, '0'           ;Mov 0 to DX
    
    WHILE_:
        MOV AH, 1         ;Setup for character input
        INT 21H 
        
        CMP AL, 0DH       ;Compareing with return key to AL
        JE END_WHILE      ;Jum  to End_while if mached
        
        INC DL            ;Increment DL by one
        JMP WHILE_
        
    END_WHILE:
        MOV BL, DL        ;Move DL to BL
        
        MOV AH, 2
        MOV DX, 0DH               ;Front of line
        INT 21H
        MOV DX, 0AH               ;Next Line
        INT 21H
        
        PRINT "TOTAL INPUTED CHARACTERS WERE : "
        
        MOV DL, BL         ;Move BL to DL
        MOV AH, 2          ;Setup for output fommand
        INT 21H
        MOV AH, 4CH        ;Terminate programe
        INT 21H

    MAIN ENDP
END MAIN