extern io_get_dec, io_print_dec, io_newline
section .data
    K dd 0
    N dd 0
    const dd 2011
    past_val dd 0
section .text
global main
main:
    call io_get_dec
    mov dword[K], eax
    call io_get_dec
    mov dword[N], eax
    call io_get_dec
    
    mov edx, 0
    div dword[const]   
    mov eax, edx
while:
    cmp dword[N], 0
    je exit
    mov dword[past_val], eax
    imul eax
    mov ebx, 1
    mov esi, 0
    call func
    mov edx, 0
    div dword[const]
    mov eax, edx
    cmp dword[past_val], eax
    je exit
    dec dword[N]
    jmp while
exit:
    call io_print_dec
    xor eax, eax
    ret
    
global func
func:
    cmp eax, 0
    je func3
    mov edx, 0
    div dword[K]
    cmp edx, 0
    je func
    jmp xz
func1:
    cmp eax, 0
    je func2
    mov edx, 0
    div dword[K]
xz:
    inc esi
    push edx
    jmp func1
func2:
    cmp esi, 0
    je func3
    pop edx
    imul edx, ebx
    add eax, edx
    imul ebx, dword[K]
    dec esi
    jmp func2
func3:
    ret
