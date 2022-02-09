%macro print 2
    pushd
    mov edx, %1
    mov ecx, %2
    mov ebx, 1
    mov eax, 4
    int 0x80
    popd
%endmacro

%macro pushd 0
    push eax
    push ebx
    push ecx
    push edx
%endmacro

%macro popd 0
    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro

%macro dprint 0
    pushd
    mov ecx, 10
    mov bx, 0

%%_divide:
    mov edx, 0
    div ecx
    push dx
    inc bx
    test eax, eax
    jnz %%_divide

%%_digit:
    pop ax
    add ax, '0'
    mov [result], ax
    print 1, result
    dec bx
    cmp bx, 0
    jnz %%_digit
    popd
%endmacro

section .text
    global _start

_start:
    mov ebx, 0
    
_x:
    add eax, [x + edi*4]
    lea edi, [edi + 1]
    cmp edi, 7
    jne _x
    
    push eax
    mov eax, xlen
    mov ecx, 4
    div ecx
    mov ecx, eax
    pop eax
    
    div ecx
    
    push eax
    
    xor ebx, ebx
    xor eax, eax
    xor edi, edi
    
_y:
    add eax, [y + edi*4]
    lea edi, [edi + 1]
    cmp edi, 7
    jne _y
    
    push eax
    mov eax, ylen
    mov ecx, 4
    div ecx
    mov ecx, eax
    pop eax
    
    div ecx
    
    pop ecx
    
    sub eax,ecx
    
    dprint
    
    xor ebx, ebx
    xor eax, eax
    ret
    
section .data:
    x dd 5, 3, 2, 6, 1, 7, 4
    xlen equ $ - x
    y dd 0, 10, 1, 9, 2, 8, 5
    ylen equ $ - y
    
section .bss
    result resb 1