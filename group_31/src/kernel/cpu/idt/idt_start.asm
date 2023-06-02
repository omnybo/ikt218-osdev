;This code is highly inspired by Bran's Kernel Development Tutorial and the code from lecture 4
[Global idt_load]  ;allows our c code to acess the function idt_load()


idt_load:
  mov eax, [esp+4]
  lidt [eax] ;loads the IDT into the processor
  ret ;returns to the C++ code 
