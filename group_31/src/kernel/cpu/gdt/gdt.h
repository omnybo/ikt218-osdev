
#include <stdint.h>

// We define the structre of a GDT entry
struct gdt_entry {
  uint16_t limit_low;
  uint16_t base_low;
  uint8_t base_middle;
  uint8_t access;
  uint8_t granularity;
  uint8_t base_high;
}__attribute__((packed));   //we call it packed to prevent compiler optimization

// We define a special pointer for our GDT
struct gdt_ptr {
  uint16_t limit;
  uint32_t base;
}__attribute__((packed));

void gdt_set_gate(int32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran);
void init_gdt();

