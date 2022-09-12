section .text ; initialized variables
  m1 db 'Enter the first number: '
  len1 equ $ - m1 

  m2 db 'Enter the second number: '
  len2 equ $ - m2

  m3 db 'Product is: '
  len3 equ $ - m3

section .bss ; uninitialized variables
  num1 resb 1
  num2 resb 1
  res resb 1

section .text
  global _start 

_start:

  ;printing the first message
  mov rax, 4
  mov rbx, 1
  mov rcx, m1
  mov rdx, len1
  int 80h

  ; taking first input
  mov rax, 3
  mov rbx, 0
  mov rcx, num1
  mov rdx, 1
  int 80h

  ;printing the second message
  mov rax, 4
  mov rbx, 1
  mov rcx, m2
  mov rdx, len2
  int 80h

  ; taking second input
  mov rax, 3
  mov rbx, 0
  mov rcx, num2
  mov rdx, 1
  int 80h

  ; multiplication steps
  mov al, [num1]
  sub al, '0'

  mov bl, [num2]
  sub bl, '0'

  mul bl
  add al, '0'

  mov [res], al
  ; multiplication step end


  ;printing the third message
  mov rax, 4
  mov rbx, 1
  mov rcx, m3
  mov rdx, len3
  int 80h

  ;printing the output
  mov rax, 4
  mov rbx, 1
  mov rcx, res
  mov rdx, 1
  int 80h

exit:
  mov rax, 1
  xor rbx, rbx
  int 80h
