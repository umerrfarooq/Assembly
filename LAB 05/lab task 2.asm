.model small
.stack 100h
.data
var1 db 5
var2 db 3
var3 db 1
result db 0
.code

    main proc   
      
    mov ax,@data
    mov ds,ax    
             
    mov al,var1
    add al,var2
    add al,var3
    
    mov result, al
                
    mov ah, 4ch      ;service routine
	int 21h	        ;exit	
	main endp

end main