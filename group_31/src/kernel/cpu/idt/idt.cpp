//This code is highly inspired by Bran's Kernel Development Tutorial and the code from lecture 4
#include "idt.h"
#include "system.h"
// We make our IDT with 256 entries and the special pointer
struct idt_entry idt[256];
struct idt_ptr ip;


extern "C" {
  extern void idt_load();  //so we can acces idt_load from the assembly
  
}

void idt_set_gate(int32_t num, uint32_t base, uint16_t sel, uint8_t flags);


void init_idt(){
  ip.limit = (sizeof(struct idt_entry) * 256) - 1;
  ip.base = ((uint32_t)&idt);

  //memset(&idt, 0, sizeof(struct idt_entry) * 256);
  idt_load();
}

void idt_set_gate(int32_t num, uint32_t base, uint16_t sel, uint8_t flags){
  idt[num].base_low    = base & 0xFFFF;
  idt[num].base_high = (base >> 16) & 0xFFFF;
  idt[num].selector = sel;
  idt[num].zero = 0;
  idt[num].flags = flags | 0x60;
}
