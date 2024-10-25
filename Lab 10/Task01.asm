display macro var, var2
    lea dx, var
    
    mov ah, 9
    int 21h
    lea dx, var2
    
    mov ah, 9
    int 21h
endm

.model small
.stack 100h
.data        
var1 db "hello", 0dh, 0ah, "$"  
var2 db "world$"              
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        display var1, var2                      
        
        mov ah, 4Ch             
        int 21h
    main endp  

end main
