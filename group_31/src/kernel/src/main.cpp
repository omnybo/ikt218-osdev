#include "system.h"
#include "../screen/screen.h"
#include "../cpu/gdt/gdt.h"
#include "../cpu/idt/idt.h"
#include "../cpu/isrs/isrs.h"

// Define entry point in asm to prevent C++ mangling
extern "C"{
    void kernel_main();
}




 
void kernel_main(void) 
{
	terminal_initialize();
  write_string("Hello World  \n");
	
  write_string("Initializing GDT  \n");
  init_gdt;

  write_string("Initializing IDT  \n");
  init_idt;

  //write_string("Initializing ISRs");
  //init_isrs;

  //write_string("Initializing IRQs");
  //init_irq;
  while (1)
  {
    
  }
  
}
