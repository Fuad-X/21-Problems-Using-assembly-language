INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    PRINT "Enter an Integer : "
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 2
    MOV DX, 0DH        ;Moving to the front of line
    INT 21H
    MOV DX, 0AH        ;Moving to the next line
    INT 21H
    
    CMP BL, '6'        ;Comparing value of BL with 6
    JGE JUMPIF         ;Jump to jumpif IF BL is greater then or equal to 6
    
    JMP JUMPELSE       ;Jump to jumpelse Without condition
    
    
    JUMPIF:
        PRINT "The Number is greater than 5"
        JMP EXIT

    
    JUMPELSE:
        PRINT "The Number is less than or Equal 5"
        JMP EXIT
                
    EXIT:
        MOV AH, 4CH    ;Programe terminate command
        INT 21H
        
    MAIN ENDP
END MAIN
