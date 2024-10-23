                                 .model small
.stack 100h
.data
    newline db 0Dh, 0Ah, '$'      ; Newline to move to the next line after printing numbers
    msg db 'Fibonacci Series: $'    ; Message to display before the series
.code
main proc
    mov ax, @data
    mov ds, ax                     ; Initialize data segment

   
    lea dx, msg
    mov ah, 09h
    int 21h

   
    mov ax, 0                      ; First Fibonacci number (0)
    push ax                        ; Push the first number to the stack

    mov ax, 1                      ; Second Fibonacci number (1)
    push ax                        ; Push the second number to the stack

    mov cx, 4                      ; Loop counter 4

fib_loop:

    pop bx                         ; BX = second last Fibonacci number
    pop ax                         ; AX = last Fibonacci number


    mov dl, al                     ; Move AX to DL
    add dl, 30h                    ; Convert to ASCII
    mov ah, 02h                    ; Display character
    int 21h

    lea dx, newline
    mov ah, 09h                    ; Display newline
    int 21h

    
    add ax, bx                     ; AX = AX + BX

    
    push bx                        ; Push BX
    push ax                        ; Push the new Fibonacci number

    
    loop fib_loop

    
    pop bx                         ; Pop the second last Fibonacci number
    pop ax                         ; Pop the last Fibonacci number

    
    mov dl, al                     ; Move AX to DL
    add dl, 30h                    ; Convert to ASCII
    mov ah, 02h                    ; Display character
    int 21h

    
    lea dx, newline
    mov ah, 09h                    ; Display newline
    int 21h

    ; End program
    mov ah, 4Ch
    int 21h

main endp
end main
