INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    PRINT "PLEASE INSERT A INTEGER : "
    
    MOV AH, 1            ;Take Input Command
    INT 21H
    MOV BL, AL           ;Moving AL to BL
    
    MOV AH, 2
    MOV DX, 0DH          ;Front of line
    INT 21H
    MOV DX, 0AH          ;Next Line
    INT 21H
    
    MOV AL, BL           ;Moving BL to AL
                         
    CMP AL, '0'          ;Comparing AL with 0
    JE ZERO              ;Jump to Zero if AL = 0
    
    CMP AL, '0'          ;Comparing AL with 0
    JL NEGATIVE          ;Jump to Zero if AL < 0
      
    CMP AL, '0'          ;Comparing AL with 0
    JG POSITIVE          ;Jump to Zero if AL > 0
    
    
    ZERO:
        PRINT "Its Zero"
        JMP EXIT         ;Unconditional Jump
    
    POSITIVE:
        PRINT "Its Positive"
        JMP EXIT         ;Unconditional Jump
    
    NEGATIVE: 
        PRINT "Its Negative"
        JMP EXIT         ;Unconditional Jump
    
    EXIT:
        MOV AH, 4CH      ;Terminate programe Command set
        INT 21H
    
    MAIN ENDP
END MAIN
