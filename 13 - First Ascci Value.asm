INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    PRINT "INSERT THE BL SYMBOL : "
    
    MOV AH, 1                  ;Take a input command
    INT 21H
    MOV BL, AL                 ;Moving AL to BL
    
    MOV AH, 2
    MOV DX, 0DH                ;First of line
    INT 21H
    MOV DX, 0AH                ;Next Line
    INT 21H
    
    PRINT "INSERT THE AL SYMBOL : "
    
    MOV AH, 1                  ;Take a input command
    INT 21H
    MOV CL, AL                 ;Moving AL to CL
    
    MOV AH, 2
    MOV DX, 0DH                ;First of line
    INT 21H
    MOV DX, 0AH                ;Next Line
    INT 21H    
    
    
    CMP CL, BL                 ;Comparing CL with BL
    JNBE BL_SML                ;Jump to BL_SML if CL not bigger or equal with BL
    
    PRINT "AL COMES FIRST : "
    MOV DL, CL                 ;moving CL to DL
    MOV AH, 2                  ;Output character Command set
    INT 21H
    JMP EXIT
    
    BL_SML:
        PRINT "BL COMES FIRST : "
        MOV DL, BL             ;moving BL to DL
        MOV AH, 2              ;Output character 
        INT 21H
    
    EXIT:
        MOV AH, 4CH
        INT 21H
 
    MAIN ENDP
END MAIN
