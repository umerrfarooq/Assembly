.model small     
.stack 100h

.code                  

main proc      
    ; Load numbers into registers
    mov al, 5          ; Load first number (5) into AL
    mov bl, 8          ; Load second number (8) into BL

    ; Push both numbers onto the stack
    push ax            ; Push AX (which contains 5)
    push bx            ; Push BX (which contains 8)

    ; Pop numbers in reverse order to swap them
    pop ax             ; Pop top of stack into AX (now contains 8)
    pop bx             ; Pop next item into BX (now contains 5)

    ; Now AX has the value of the second number (8)
    ; and BX has the value of the first number (5)

    ; Push swapped values back onto the stack
    push ax            ; Push the swapped value (8) back onto the stack
    push bx            ; Push the swapped value (5) back onto the stack

    ; At this point, you can check the stack in EMU8086
    ; The stack will have the values 5 and 8 after the swap

    ; Program termination
    mov ax, 4C00h      ; DOS terminate program
    int 21h            ; Call DOS interrupt

main endp

end main