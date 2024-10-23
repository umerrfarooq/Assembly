.model small
.stack 100h
.data
result db 0
.code

    main proc   
      
    mov ax,@data
    mov ds,ax    
         
    mov al,  3
    add al,  5
    sub al,  2
    sub al,  1
    add al,  3            
        
    add al,30h           
    mov result,al 
    
    mov ah,02
    mov dl,result
    int 21h   
                
    mov ah,4ch      	;service routine
	int 21h	        ;exit	
	main endp

end main 

