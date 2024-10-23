.model small
.stack 100h
.data
    arr db '1','2','3','2'  ; Array of characters
.code 
    main proc
        mov ax, @data       ; Get reference of data segment
        mov ds, ax
        
        lea si, arr         ; offset
        mov cx, 4           ; iteration loop counter
        mov bl, 0           ; initialize BL to store the sum
        
    LABEL:
        mov dl, [si]        ; Get array value
        sub dl, 48          ; Convert ASCII to numeric 
        add bl, dl          ; Add the numeric value to BL 
        
        inc si              ; Increament to Move to the next element in the array
        loop LABEL          ; Repeat for all elements
        
        add bl, 48          ; Convert the sum to ASCII
        mov dl, bl           
        
        mov ah, 2           
        int 21h
        
        
    main endp
end main
