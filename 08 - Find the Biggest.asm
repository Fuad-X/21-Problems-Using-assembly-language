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
    JG GREAT             ;Jump to Greate if BL is greater then CL
    
    JMP LESS             ;Unconditional Jump
    
    
    GREAT:
        PRINT "A IS GREATER THAN B"
        JMP EXIT
    
    LESS:
        PRINT "B IS GREATER A"
        JMP EXIT 
    
    
    EXIT:
    MOV AH, 4CH           ;terminate programe
    INT 21H
    
    MAIN ENDP
END MAIN
