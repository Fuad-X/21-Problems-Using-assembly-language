INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    MOV CX, 80        ;Moving 80 to CX
    
    MOV AH, 2         ;Setting Up character output 
    MOV DL, '*'       ;Moving * to DL
    
    TOP:
        INT 21H       ;printing using innaraption
        
        LOOP TOP      ;Looping untill CX = 0
    
    MAIN ENDP
END MAIN
