#include <stdint.h>




//structure for the IDT entries
struct idt_entry{
	uint16_t    base_low;      // The lower 16 bits of the ISR's address
	uint16_t    selector;      // The GDT segment selector 
	uint8_t     zero;          // Set to zero
	uint8_t     flags;         // Type and attributes
	uint16_t    base_high;     // The higher 16 bits of the ISR's address
} __attribute__((packed));


struct idt_ptr {
  uint16_t limit;
  uint32_t base;
}__attribute__((packed));


void init_idt();
void idt_set_gate(int32_t num, uint32_t base, uint16_t sel, uint8_t flags);