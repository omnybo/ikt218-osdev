
#include <stdint.h>

// We define the structre of a GDT entry
struct gdt_entry {
  uint16_t limit_low;  //Lower 16 bits of the descriptor's limit
  uint16_t base_low;   //Lower 16 bits the descriptor's base adress
  uint8_t base_middle; //Middle 8 bits the descriptor's base adress
  uint8_t access;      //Flags definng who has access to the memory that the descriptor is referencing
  uint8_t granularity; //8 bits for granularity
  uint8_t base_high;   //Upper 8 bits the descriptor's base adress
}__attribute__((packed));   //we call it packed to prevent compiler optimization. Prevent in from adding padding

// We define a special pointer for our GDT
struct gdt_ptr {
  uint16_t limit;
  uint32_t base;
}__attribute__((packed));

// functions that is used in the C++ file
void gdt_set_gate(int32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran);
void init_gdt();

