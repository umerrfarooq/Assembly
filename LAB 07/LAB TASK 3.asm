.model small
.stack 100h
.data
    array db 5, 9, 8, 2, 6, 1   ; Array with 6 elements
    largest db ?                ; To store the largest value

.code
main:
    mov ax, @data
    mov ds, ax                   ; Initialize data segment

    ; Initialize stack pointer
    mov sp, 100h                

    ; Set the first element as the largest initially
    mov al, [array]              ; Move the first element to AL
    mov largest, al              ; Assume the first element is the largest for
now

    ; Compare the remaining elements
    lea si, [array+1]            
    mov cx, 5                    ; Loop counter 5

check_loop:
    mov al, [si]                 
    cmp al, largest              ; Compare numbers
    jle next                     

    mov largest, al              ; If current value is greater, update largest

next:
    inc si                       ; increament
    loop check_loop              ; Repeat for all elements
; Push the largest value onto the stack
    mov al, largest              ; Move the largest value into AL
    xor ah, ah                   ; Clear AH to push AX correctly
    push ax                      ; Push it onto the stack

    ; End of program
    mov ah, 4Ch
    int 21h
end main