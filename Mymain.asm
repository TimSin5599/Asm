extern io_get_dec, io_print_dec, io_newline
section .data
    x1 dd 0
    y1 dd 0
    x2 dd 0
    y2 dd 0
    x3 dd 0
    y3 dd 0
    x_ dd 0
    y_ dd 0
    sum dd 3
section .text
global main
main:
    call io_get_dec
    mov dword[x1], eax
    call io_get_dec
    mov dword[y1], eax
    call io_get_dec
    mov dword[x2], eax
    call io_get_dec
    mov dword[y2], eax
    call io_get_dec
    mov dword[x3], eax
    call io_get_dec
    mov dword[y3], eax
    
    mov eax, dword[x1]
    sub eax, dword[x2]
    call abs_
    mov dword[x_], eax
    mov eax, dword[y1]
    sub eax, dword[y2]
    call abs_
    mov dword[y_], eax   
    call NOD
    add dword[sum], eax
     
    mov eax, dword[x2]
    sub eax, dword[x3]
    call abs_
    mov dword[x_], eax
    mov eax, dword[y2]
    sub eax, dword[y3]
    call abs_
    mov dword[y_], eax   
    call NOD   
    add dword[sum], eax
    
    mov eax, dword[x3]
    sub eax, dword[x1]
    call abs_
    mov dword[x_], eax
    mov eax, dword[y3]
    sub eax, dword[y1]
    call abs_
    mov dword[y_], eax   
    call NOD
    add dword[sum], eax
    
    call area

    add eax, 2
    sub eax, dword[sum]
    mov ebx, 2
    mov edx, 0
    div ebx

    call io_print_dec
    xor eax, eax
    ret
    
global abs_
abs_:
    cmp eax, 0
    jge abs_2
    imul eax, -1
abs_2:
    ret  
    
global area
area:
    mov eax, dword[x3]
    sub eax, dword[x1]
    mov ebx, dword[y2]
    sub ebx, dword[y1]
    imul eax, ebx 
    mov dword[y2], eax
    
    mov eax, dword[x2]
    sub eax, dword[x1]
    mov ebx, dword[y3]
    sub ebx, dword[y1]
    imul eax, ebx
    sub eax, dword[y2]
    
    call abs_
    ret
    
global NOD
NOD:
    cmp dword[x_], 0
    je Y
    cmp dword[y_], 0
    je X
L1:
    mov eax, dword[x_]
    cmp eax, dword[y_]
    je EXIT
    jge L2
    mov eax, dword[y_]
    sub eax, dword[x_]
    mov dword[y_], eax
    jmp L1
    
L2:
    sub eax, dword[y_]
    mov dword[x_], eax
    jmp L1
    
EXIT:
    dec eax
    ret
X:
    mov eax, dword[x_]
    jmp EXIT
Y:
    mov eax, dword[y_]
    jmp EXIT
