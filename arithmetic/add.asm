%macro display 2
  mov rax, 4
  mov rbx, 1
  mov rcx, %1
  mov rdx, %2
  int 80h
%endmacro

%macro take_input 2
  mov rax, 3
  mov rbx, 0
  mov rcx, %1
  mov rdx, %2
  int 80h
%endmacro

section .text
  m1 db 'Enter the first number: '
  len1 equ $ - m1

  m2 db 'Enter the second number: '
  len2 equ $ - m2

  m3 db 'The sum is : '
  len3 equ $ - m3 

  m4 db 'Enter two numbers such that the sum is less than 10', 0xa
  len4 equ $ - m4

section .bss
  num1 resb 2
  num2 resb 2
  res resb 2

section .text 
  global _start

_start:

  mov rax, 4
  mov rbx, 1
  mov rcx, m4
  mov rdx, len4
  int 80h

  ; writing the first message
  display m1, len1

  ; taking first input
  take_input num1, 2

  ;writing the second message
  dispaly m2, len2

  ; taking second input
  take_input num2, 2

  mov rax, [num1] ; storing num1 into rax
  sub rax, '0' ; subtracting 0 to convert into decimal value

  mov rbx, [num2] ; storing num2 into rbx
  sub rbx, '0' ; subtracting 0 to convert into decimal value

  add rax, rbx ; adding both numbers
  add rax, '0' ; adding 0 to convert int ascii value
  mov [res], rax ; storing sum into res

  ;writing the third message
  display m3, len3

  ;writing the sum 
  display res, 2
exit:
  mov eax, 1
  xor rbx, rbx
  int 80h