.model small
.stack 100h
.data
    original_string db 'This is a string$'
    reversed_string db 20 dup('$')
    string_length equ $-original_string

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, string_length
    lea si, original_string
    lea di, reversed_string

    call reverse_string

    mov ah, 9
    lea dx, original_string
    int 21h

    mov ah, 9
    lea dx, reversed_string
    int 21h

    mov ah, 4ch
    int 21h

reverse_string proc
    push cx
    push si
    push di

    dec cx
    lea di, [di + cx]

reverse_loop:
    mov al, [si]
    mov [di], al
    inc si
    dec di
    loop reverse_loop

    pop di
    pop si
    pop cx
    ret
main endp
end main