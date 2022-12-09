INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC  
    PRINT "PLEASE INSERT A STRING : "
    
    MOV BL, '0'    ;Moving 0 character into BL
    MOV CX, 0      ;Moving 0 into CX
    MOV AH, 1      ;Take Input command set for character
    
    LVL2:
    CMP AL, 0DH    ;Compare Input With return key
    JE LVL         ;Jump to LVL if AL is return Key
    
    INT 21H        
    INC BL         ;Incrementing BL by 1
    INC CX         ;Incrementing CX by 1
    PUSH AX        ;Pushing AX value in Stack
    
    JMP LVL2       ;Unconditional Jump
    
    LVL:
    MOV AH, 2
    MOV DX, 0DH    ;Front of line
    INT 21H
    MOV DX, 0AH    ;Next line
    INT 21H
    
    PRINT "TOTAL INPUTED CHARACTERS WERE : "
    
    DEC BL         ;Decrementing BL by 1
    MOV DL, BL
    MOV AH, 2
    INT 21H
    
    MOV AH, 2
    MOV DX, 0DH    ;Front of line
    INT 21H
    MOV DX, 0AH    ;Next line
    INT 21H
    
    PRINT "THE REVERSE STRING IS : "
    POP DX         ;POP stack in DX
    DEC CX         ;Decrement CX by 1
    MOV AH, 2      ;Set output command for characters
    
    OUTPUT:
        JCXZ EXIT         ;Jump if CX is equal to 0
        POP DX            ;POP into DX
        INT 21H
        LOOP OUTPUT       ;LOOP UNTILL CX is 0
        
    EXIT:
        MOV AH, 4CH
        INT 21H
            
    MAIN ENDP
END MAIN