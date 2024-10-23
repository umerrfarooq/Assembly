.model small
.stack 100h
.data
.code 
    main proc
        mov cx, 10      ; set loop counter 0 to 9
        mov dl, '0'
               
    LABEL:        ; loop starting point
        mov ah, 2      ; DOS interrupt for displaying character
        int 21h                                                
        
        inc dl      ; increament 
        
        loop LABEL     ; decrement cx and jump to LABEL if cx != 0

    main endp
end main
