#include "system.h"
#include "../screen/screen.h"


// Define entry point in asm to prevent C++ mangling
extern "C"{
    void kernel_main();
}




 
void kernel_main(void) 
{
	terminal_initialize();
  write_string("Hello World");
	
}
