.model small
.stack 100h
.data       
    arr db 4,5,6,7,9
.code 
        main proc
            mov ax, @data  ;get ref of data
            mov ds, ax
            
            lea si, arr    ;offset
            mov cx, 5
            
            LABEL:  ;Starting of loop
            
            mov dl, [si]    
            add dl, 48
            mov ah, 2      ;Output
            int 21h
            
            inc si      ; increament the value of si for getting next value of arr
                  
                  loop LABEL         ;Go back to the Label and run loop until cx !=5
            
        main endp
end main