INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    PRINT "PLEASE PROVIDE A INPUT : "
    
    MOV AH, 1    ;Input a character command
    INT 21H      
    MOV BL, AL   ;Moving data from AL register to BL
      
    MOV CX, 8    ;Moving 8 into CX
    
    MOV AH, 2
    MOV DX, 0DH    ;Front of line
    INT 21H
    MOV DX, 0AH    ;Next line
    INT 21H 
    
    PRINT "The biary of its ascii value is : "
    
    LEVEL:
        SHL BL, 1    ;Shift 1 bit to the left
        JNC ZERO     ;If the carry flag is zero jump to zero
        
        JC ONE       ;If the carry flag is 1 then jumo To one
    
    ZERO:
        MOV AH, 2          ;Set input command for characters
        MOV DL, '0'        ;Moving 0 to DL
        INT 21H
        LOOP LEVEL         ;loop to Level
        JMP EXIT
    
    ONE:
        MOV AH, 2          ;Set input command for characters
        MOV DL, '1'        ;Moving 1 to DL
        INT 21H
        LOOP LEVEL         ;Loop to Level
        JMP EXIT 
        
    EXIT:
        MOV AH, 4CH
        INT 21H        
    
    MAIN ENDP
END MAIN