                                   .model small
.stack 100h
.data
    values dw 5 dup(0)            ; Array to hold five integers
.code
main proc
    mov ax, @data
    mov ds, ax                     ; Initialize the data segment

    mov ax, 1                      
    push ax                        ; Push the first integer onto the stack

    mov ax, 2                      
    push ax                        ; Push the second integer onto the stack

    mov ax, 3                      
    push ax                        ; Push the third integer onto the stack

    mov ax, 4                      
    push ax                        ; Push the fourth integer onto the stack

    mov ax, 5                      
    push ax                        ; Push the fifth integer onto the stack

    mov cx, 5                      
    mov di, offset values          ; Set DI to the start of the values array

pop_loop:
    pop ax                         
    mov [di], ax                  ; Store popped value in the array
    add di, 2                      
    loop pop_loop                  ; Repeat for all five integers

    mov bp, sp                     
    add sp, 10                     ; Clear stack space for the integers

    mov ax, 4C00h                  
    int 21h                        ; Exit program

main endp
end main
