;This code is highly inspired by Bran's Kernel Development Tutorial

[Global gdt_flush]  ;allows our c code to acess the function gdt_flush()
extern gp  ;allows to use our special pointer from the C++ code

; The gdt_flush function sets up our new segment registers. 
gdt_flush:
  lgdt[gp] ;loads in the gdt with our pointer

  mov ax, 0x10 ;reloads data segment
  mov ds, ax ;reloads the segment registers
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov ss, ax
  jmp 0x08:flush ;far jump to reload code segment

flush:
  ret  ; returns to the C++ code