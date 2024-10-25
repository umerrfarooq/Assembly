.model small
.stack 100h
.data
    var1 db 1          ; Initialize var1 with 1
    var2 db 3          ; Initialize var2 with 3
    temp db 0          ; Temporary variable for swapping

; Macro to swap two variables
swap_vars macro v1, v2
    mov al, v1          ; Load v1 into AL
    mov temp, al        ; Store v1 in temp
    mov al, v2          ; Load v2 into AL
    mov v1, al          ; Set v1 to v2
    mov al, temp        ; Load temp into AL
    mov v2, al          ; Set v2 to temp
endm


print_num macro num
    mov al, num         
    add al, '0'         ; Convert number to ASCII ('0' to '9')
    mov dl, al          
    mov ah, 2           
    int 21h             ; Display character
endm

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Swap var1 and var2
    swap_vars var1, var2

    ; Print 
    print_num var1       
    print_num var2       

    mov ah, 4Ch          ; Exit program
    int 21h
main endp

end main
