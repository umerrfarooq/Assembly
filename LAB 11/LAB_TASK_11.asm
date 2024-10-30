display macro var, var2, var3
    lea dx, var
    mov ah, 9
    int 21h
    
    lea dx, var2
    mov ah, 9
    int 21h
    
    lea dx, var3
    mov ah, 9
    int 21h   
endm

display2 macro text
    lea dx, text
    mov ah, 9
    int 21h
endm

.model small
.stack 100h
.data
    var1 db "1. Addition", 0dh, 0ah, "$"  
    var2 db "2. Subtraction", 0dh, 0ah, "$"  
    var3 db "3. Division", 0dh, 0ah, "$"   
         
    number1 db "Enter Number 1: $"
    number2 db "Enter Number 2: $"
    
    nextLine db 0dh, 0ah, "$"
    takeInput db "Enter Choice: $"
    
    resultMsg db "The Result is: $"
    divideByZeroMsg db "Error: Division by Zero!$"
    
    result db "Result: $", 0dh, 0ah, "$" 
    
    resValue db 2 dup(0)                  ; Storage for the result

.code

; Procedure to perform arithmetic operations
performOperation proc
    cmp bl, 1                   ; Check for Addition
    je addition
    cmp bl, 2                   ; Check for Subtraction
    je subtraction
    cmp bl, 3                   ; Check for Division
    je division
    ret

addition: 
    mov al, bh                  ; Load first number into al
    add al, ch                  ; Add second number
    jmp store_result

subtraction:
    mov al, bh                  ; Load first number into al
    sub al, ch                  ; Subtract second number
    jmp store_result

division:
    cmp ch, 0                   ; Check for division by zero
    je div_by_zero
    mov al, bh                  ; Load first number into al
    mov ah, 0                   ; Clear ah for division
    div ch                       ; Divide bh by ch
    jmp store_result

div_by_zero:
    display2 divideByZeroMsg
    ret

store_result:
    add al, '0'                 
    mov resValue[0], al         ; Store result
    mov resValue[1], '$'        
    ret
performOperation endp

main proc
    mov ax, @data
    mov ds, ax
    
    
    display var1, var2, var3
    
    
    display2 takeInput
    
    
    mov ah, 1                   ; Single character input
    int 21h
    sub al, '0'                 
    mov bl, al                  

    
    cmp bl, 1                   ; Addition
    je prompt_numbers
    cmp bl, 2                   ; Subtraction
    je prompt_numbers
    cmp bl, 3                   ; Division
    je prompt_numbers
    
    ; Invalid choice, go back to main
    jmp main

prompt_numbers:      
    ; New line
    display2 nextLine

    ; Prompt for first number
    lea dx, number1             
    mov ah, 9                   ; Display the prompt
    int 21h
    mov ah, 1                   ; Single character input
    int 21h
    sub al, '0'                 ; Convert ASCII to integer
    mov bh, al                  

    ; New line
    display2 nextLine 
   
    ; Prompt for second number
    lea dx, number2             
    mov ah, 9                   ; Display the prompt
    int 21h
    mov ah, 1                   ; Single character input
    int 21h
    sub al, '0'                 ; Convert ASCII to integer
    mov ch, al                 
    
    
    call performOperation        ; Call the operation procedure

    
    ; New line
    display2 nextLine
    display2 resultMsg
    lea dx, resValue           
    
    mov ah, 9
    int 21h

    
    mov ah, 1
    int 21h
    jmp main

main endp
end main