

[Global gdt_flush ]  //allows our c code to acess the function gdt_flush()
extern gp
gdt_flush:
  mov eax, [esp+4]
  lgdt[eax]

  mov ax, 0x10
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov ss, ax
  jmp 0x08:.flush

.flush:
  ret