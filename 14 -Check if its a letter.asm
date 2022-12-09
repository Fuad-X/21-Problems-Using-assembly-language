INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    PRINT "PLEASE INSERT SOMETHING : "
    
    MOV AH, 1            ;Set Input character command
    INT 21H
    MOV BL, AL           ;Mov AL to BL
    
    MOV AH, 2
    MOV DX, 0DH          ;Front of line
    INT 21H
    MOV DX, 0AH          ;Next Line
    INT 21H
    
    CMP BL, 'A'          ;Compare BL with A
    JL NOT_LETTER        ;Jump to Not Letter if Less then A
    
    CMP BL, 'z'          ;Compare BL with z
    JG NOT_LETTER        ;Jump to not letter if Greatter then Z
    
    CMP BL, 'Z'          ;Compare BL with Z
    JG CHECK             ;Jump to check if BL is greater then Z
    
    JMP A_LETTER         ;Jump to A letter with out condition
    
    CHECK:
        CMP BL, 'a'             ;Compare BL with a
        JL NOT_LETTER           ;Jump to Not Letter if BL is less then a
    
    A_LETTER:                            
        PRINT "ITS A LETTER"
        JMP EXIT                ;Unconditional Jump
                        
                        
    NOT_LETTER:
        PRINT "ITS NOT A LETTER"
    
    EXIT:
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN
