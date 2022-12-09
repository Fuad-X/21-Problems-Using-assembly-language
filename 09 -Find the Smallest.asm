INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    PRINT "ENTER THE VALUE OF A : "
    
    MOV AH, 1            ;Setting character input command
    INT 21H
    MOV BL, AL           ;Moving AL to BL
    
    MOV AH, 2
    MOV DX, 0DH          ;Front of line
    INT 21H
    MOV DX, 0AH          ;Next line
    INT 21H
    
    
    PRINT "ENTER THE VALUE OF B : "
    
    MOV AH, 1            ;Setting command for input characer
    INT 21H
    MOV CL, AL
                         ;Moving AL to CL
    MOV AH, 2
    MOV DX, 0DH          ;Front of line
    INT 21H
    MOV DX, 0AH          ;New Line
    INT 21H
    
    CMP BL, CL           ;Compare BL with CL
    JL LESS              ;Jump to Less if BL is smaller then CL
    
    JMP GREAT            ;Jump to Great Unconditionally
    
    
    GREAT:
        PRINT "B IS LESS THEN A"
        JMP EXIT
    
    LESS:
        PRINT "A IS LESS THAN B"
        JMP EXIT 

    
    
    EXIT:
    MOV AH, 4CH           ;terminate programe
    INT 21H
    
    MAIN ENDP
END MAIN
