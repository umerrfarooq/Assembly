.model small
.stack 100h
.data
    msgg db "HELLO", 0  

; Macro to reverse a string
reverse_string macro str
    mov si, offset str   ; Load address of the string into SI
    mov cx, 5           

    ; Push each character onto the stack
    push_loop:
        mov al, [si]     
        test al, al      
        jz end_push      
        push ax          ; Push the character onto the stack
        inc si           ; Move to the next character
        inc cx           ; Increment
        jmp push_loop    

    end_push:
    
    
    mov cx, 5           ; Reset cx
    
    pop_loop:
        pop ax           ; Pop character from stack into AX
        mov dl, al       
        mov ah, 2        
        int 21h          ; Print value
        loop pop_loop     
endm

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Call the macro
    reverse_string msgg

    ; Exit the program
    mov ah, 4Ch        
    int 21h
main endp

end main
