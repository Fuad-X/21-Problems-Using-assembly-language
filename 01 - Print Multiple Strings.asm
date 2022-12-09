.MODEL SMALL
.STACK 100H
.DATA
VAR DB "HELLO WORLD$"
VAR2 DB "I AM A GAME DEVELOPER$"
VAR3 DB "WELLCOME TO MICROPROCESSOR$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9    ;Print String Mode
    LEA DX, VAR  ;Load Variable from Data segments
    INT 21H      ;Call the console to run command
    
    MOV AH, 2    ;Print Character mode                  
    MOV DX, 0DH  ;Go to Front of The Line
    INT 21H
    MOV DX, 0AH  ;Go to New Line
    INT 21H
    
    MOV AH, 9    ;Print String Mode
    LEA DX, VAR2 ;Load Variable from Data segments
    INT 21H      ;Call the console to run command
    
    MOV AH, 2    ;Print Character mode                  
    MOV DX, 0DH  ;Go to Front of The Line
    INT 21H      
    MOV DX, 0AH  ;Go to New Line
    INT 21H
    
    MOV AH, 9    ;Print String Mode
    LEA DX, VAR3 ;Load Variable from Data segments
    INT 21H      ;Call the console to run command
    
    MAIN ENDP
END MAIN