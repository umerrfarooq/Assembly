.model small
.stack 100h
.data

.code

add_nums macro num1, num2
    mov al, num1         ; Load first number into AL
    add al, num2         ; Add second number to AL
    add al, '0'          ; Convert result to ASCII character ('0' to '9')

    
    mov dl, al           ; Move result to DL for printing
    mov ah, 2            
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax

    add_nums 3, 2        ; Call the macro

    mov ah, 4Ch          ; Exit program
    int 21h
main endp

end main
