.model small
.stack 100h
.data
    msg db 'Umer$'               ; String terminated with $
    strlen1 equ $ - msg - 1       ; Calculate string length 5
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display the original string
    lea dx, msg
    mov ah, 9
    int 21h

    ; Print newline
    mov ah, 02h                  
    mov dl, 0Dh                  
    int 21h
    mov dl, 0Ah                  
    int 21h

    ; Push characters onto the stack
    mov si, 0                     ; Initialize index for string
    mov cx, strlen1               ; Set counter 5

push_loop:
    mov al, msg[si]               ; Load character from msg into AL
    push ax                       ; Push character onto the stack
    inc si                        ; Increment index
    loop push_loop                ; Loop

    mov cx, strlen1               ; Reset counter to 5

disp_loop:
    pop ax                        ; Pop character from stack into AX
    mov dl, al                    ; Move character to DL for printing
   
    mov ah, 02h                   ; For Display
    int 21h                      
    loop disp_loop                ; Loop

    ; Exit the program
    mov ah, 4Ch                  
    int 21h                      

main endp
end main