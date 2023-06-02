//This code is highly inspired by Bran's Kernel Development Tutorial and the code from lecture 4

#include "gdt.h"

// We make our GDT with 3 entries and the special pointer
struct gdt_entry gdt[3];
struct gdt_ptr gp;

// extern "C" does so that we can implemt our ASM functions in the C++ code
extern "C" {
  extern void gdt_flush(uint32_t);
}


void init_gdt() asm ("init_gdt");  //so the boot assembly code can access the init_gdt function
void gdt_set_gate (int32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t granularity);


// This is our main function. It will setup the GDT pointer, and the GDT with our entries,
// and then call the flush function which will flush out old entries and load in the new ones.
void init_gdt(){
  // We set the GDT limit
  gp.limit = (sizeof(struct gdt_entry) * 3) - 1;
  gp.base = (uint32_t) &gdt;

  // num, base, limit, access, granularity
  gdt_set_gate(0, 0, 0, 0, 0); //Null segment
  gdt_set_gate(1, 0, 0xFFFFFFFF, 0x9A, 0xCF); //Code segment
  gdt_set_gate(2, 0, 0xFFFFFFFF, 0x92, 0xCF); //Data segment

  gdt_flush((uint32_t)&gp);
}


// Function to setup a descriptor in the GDT
void gdt_set_gate(int32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran)
{
    //descriptor base adresses
    gdt[num].base_low    = (base & 0xFFFF);
    gdt[num].base_middle = (base >> 16) & 0xFF;
    gdt[num].base_high   = (base >> 24) & 0xFF;

    //descriptor limits
    gdt[num].limit_low   = (limit & 0xFFFF);
    gdt[num].granularity = (limit >> 16) & 0x0F;

    // granularity and flags for who can access
    gdt[num].granularity |= gran & 0xF0;
    gdt[num].access      = access;
}

