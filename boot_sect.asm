
[org 0x7c00]

mov bx, message
call print_string
jmp $


;bx passed into function as parameter
;al is character to print
print_string:
    mov ah, 0x0e

    ;ax starting mem offset = 0
    mov ax, 0x00

    loop:
    
    add cx, ax, bx
    mov al, [cx]
    int 0x10
    add ax, 1

    cmp ax, 10
    jne loop


    
    ret


message: 
    db "Hello World", 0

times 510-($-$$) db 0
dw 0xaa55
