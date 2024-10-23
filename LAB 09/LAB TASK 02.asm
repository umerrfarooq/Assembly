.model small
.stack 100h
.data
    num1 db 10
    num2 db 20
    num3 db 30
    result db 10 dup('$')
    message db "The sum of three digits is: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 3
    lea si, result
    mov al, num1
    add al, num2
    add al, num3

    call convert_to_string

    mov ah, 9
    lea dx, message
    int 21h

    mov ah, 9
    lea dx, result
    int 21h

    mov ah, 4ch
    int 21h

convert_to_string proc
    push ax
    push cx
    push si

    mov bl, 10
    mov bh, 0
    div bl

    mov [si], bh
    inc si

    cmp al, 0
    jne convert_to_string

    pop si
    pop cx
    pop ax
    ret
main endp
end main