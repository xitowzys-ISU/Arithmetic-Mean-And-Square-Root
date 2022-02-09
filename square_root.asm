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
    finit
    fild dword [number]
    fsqrt
    fistp dword [result]

    mov eax, [result]

    dprint

    ret

section .data
    number dd 121

section .bss
    result resb 1