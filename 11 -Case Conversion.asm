INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    PRINT "ENTER A CAPITAL LETTER : " 
    
    MOV AH, 1              ;Take characeter input command
    INT 21H
    MOV BL, AL             ;Moving AL to BL
    
    
    MOV AH, 2
    MOV DX, 0DH            ;Front of line
    INT 21H
    MOV DX, 0AH            ;Next Line
    INT 21H
    
    PRINT "THE LOWER CASE OF THIS LETTER IS : "
    ADD BL, 32             ;Add 32 with BL
    MOV DL, BL             ;Moving BL to DL
    
    MOV AH,2               ;out put Characeter command
    INT 21H

    
    MAIN ENDP
END MAIN
