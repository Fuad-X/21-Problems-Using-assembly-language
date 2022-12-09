.MODEL SMALL
.STACK 100H
.DATA
VAR DB "Enter the first value : $"
VAR2 DB "Enter the second value : $" 
VAR5 DB "Enter the third value : $"
VAR3 DB " + $"
VAR4 DB " = $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9    ;Print String Command
    LEA DX, VAR  ;Load variable from Data segment
    INT 21H      ;Call Console to run command
    
    MOV AH, 1    ;Input a character command
    INT 21H      
    MOV BL, AL   ;Moving data from AL register to BL
    
    MOV AH, 2                     
    MOV DX, 0DH  ;Go to Front of Line
    INT 21H      
    MOV DX, 0AH  ;Go to New Line
    INT 21H
    
    MOV AH, 9    ;Print String Command
    LEA DX, VAR2 ;Load variable from Data segment
    INT 21H      ;Call Console to run command
    
    MOV AH, 1    ;Input a character command
    INT 21H      
    MOV BH, AL   ;Moving data from AL register to BH
    
    MOV AH, 2                     
    MOV DX, 0DH  ;Go to Front of Line
    INT 21H      
    MOV DX, 0AH  ;Go to New Line
    INT 21H
    
    MOV AH, 9    ;Print String Command
    LEA DX, VAR5 ;Load variable from Data segment
    INT 21H      ;Call Console to run command
    
    MOV AH, 1    ;Input a character command
    INT 21H      
    MOV CH, AL   ;Moving data from AL register to BH
    
    MOV AH, 2                     
    MOV DX, 0DH  ;Go to Front of Line
    INT 21H      
    MOV DX, 0AH  ;Go to New Line
    INT 21H
    
    
    MOV AH, 2    ;Setting up for Print character command
    MOV DL, BL   ;Moving data from BL register to DL
    INT 21H
    
    MOV AH, 9    ;Print String Command
    LEA DX, VAR3 ;Load variable from Data segment
    INT 21H      ;Call Console to run command   
    
    MOV AH, 2    ;Setting up for Print character command
    MOV DL, BH   ;Moving data from BL register to DL
    INT 21H    

    MOV AH, 9    ;Print String Command
    LEA DX, VAR3 ;Load variable from Data segment
    INT 21H      ;Call Console to run command
    
    MOV AH, 2    ;Setting up for Print character command
    MOV DL, CH   ;Moving data from BL register to DL
    INT 21H    

    MOV AH, 9    ;Print String Command
    LEA DX, VAR4 ;Load variable from Data segment
    INT 21H      ;Call Console to run command

    MOV DL, BL   ;Moving data from BL register to DL
    ADD DL, BH   ;Adding data from BH register to DL
    SUB DL, "0"  ;Substracting 0 from register DL
    ADD DL, CH   ;Adding data from BH register to DL
    SUB DL, "0"  ;Substracting 0 from register DL
    
    MOV AH, 2    ;Print Character command
    INT 21H   
    
    MAIN ENDP
END MAIN