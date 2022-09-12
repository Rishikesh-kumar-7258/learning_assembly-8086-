section .text ; initialized data
  m1 db 'Please enter a number : '
  len1 equ $ - m1
  m2 db 'You entered: '
  len2 equ $ - m2

section .bss ; uninitialized data
  num resb 5

section .text
  global _start

_start:
  ;writing first message
  mov rax, 4
  mov rbx, 1
  mov rcx, m1
  mov rdx, len1
  int 80h

  ; Input data and save into memory
  mov rax, 3
  mov rbx, 2
  mov rcx, num
  mov rdx, 5
  int 80h

  ; writing second message
  mov rax, 4
  mov rbx, 1
  mov rcx, m2
  mov rdx, len2
  int 80h

  ; showing the input data
  mov rax, 4
  mov rbx, 1
  mov rcx, num
  mov rdx, 5
  int 80h

  ; exit code
  mov rax, 1
  mov ebx, 0
  int 80h
