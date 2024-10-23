.model small
.stack 100h
.data
    var1 db 23      ; initial value of var1
    var2 db 65      ; initial value of var2

.code
main proc
    mov ax, @data   ; initialize data segment
    mov ds, ax

    ; Load the values of var1 and var2 into registers
    mov al, var1    ; load var1 into AL
    mov bl, var2    ; load var2 into BL

    ; Swap the values
    mov var1, bl    ; store the value of BL (var2) into var1
    mov var2, al    ; store the value of AL (var1) into var2

    ; Exit the program
    mov ah, 4Ch     ; DOS terminate service
    int 21h         ; Interrupt to terminate the program
main endp

end main
