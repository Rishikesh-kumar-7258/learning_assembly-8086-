section .text
  global _start ; must be declared for linker

_start: ; tell linker the entry point

  ; code for writing msg
  mov rdx, len
  mov rcx, msg
  mov rbx, 1
  mov rax, 4 ; system call number (sys_write)
  int 0x80

  ; Code for writing s2
  mov rdx, 9
  mov rcx, s2
  mov rbx, 1
  mov rax, 4 ; system call number (sys_write)
  int 0x80

  ; code for exiting the program
  mov rax, 1 ; system call number (sys_exit)
  int 0x80

section .data ; for initializing variables and putting data
  msg db 'Displaying 9 stars', 0xa
  len equ $ - msg 
  s2 times 9 db '*'
  