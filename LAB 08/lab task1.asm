                                        .model small
.stack 100h
.data
    msg db 'Umer$'            ; String terminated with $
    strlen1 equ $ - msg - 1     ; Calculate string length 6 (excluding $)
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

    ; Reverse the string in memory
    mov si, 0                  ; Start index
    mov di, strlen1 - 1        ; End index (5th element, 0-based index)
    
reverse_loop:
    cmp si, di                 ; Compare the start and end indices
    jge done_reversing          ; If SI >= DI, we are done

    ; Swap characters at SI and DI
    mov al, msg[si]            ; Load character at SI
    mov bl, msg[di]            ; Load character at DI
    mov msg[si], bl            ; Store DI's character at SI
    mov msg[di], al            ; Store SI's character at DI

    ; Move indices towards the center
    inc si                     ; Move SI forward
    dec di                     ; Move DI backward
    jmp reverse_loop           ; Repeat until SI >= DI

done_reversing:
    ; Display the reversed string
    lea dx, msg
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp
end main
