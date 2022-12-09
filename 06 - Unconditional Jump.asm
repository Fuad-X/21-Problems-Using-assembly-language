INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    
    PRINT "We are jumping without condition to keep love sign in the output"
    
    MOV AH, 2        
    MOV DX, 0DH      ;Move to front of line
    INT 21H
    MOV DX, 0AH      ;Move to next line
    INT 21H

    
    MOV DL, 3H       ;Moving 3 as hexadacimal into DL register
    
    JMP FUNCTION     ;Unconditional Jump
    
    PRINT "We are jumping from here to"
    
    MOV DL, 1H       ;Moving 1 as hexadacimal into DL register
    
    PRINT "Here so the value of dl does not changes"
    
    FUNCTION:
        PRINT "So out value remains : "
        MOV AH, 2    ;Setting up character output command
        INT 21H
        
    MAIN ENDP
END MAIN
