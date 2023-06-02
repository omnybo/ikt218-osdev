#include <stdint.h>


struct registers
{
  uint32_t ds;
  uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax;
  uint32_t int_no, err_code;
  uint32_t eip, cs, eflags, useresp, ss;
};



void init_isrs();
void fault_handler(struct registers *r);

void irq_remap(void);
void init_irq();
void irq_handler(struct registers r);
void init_irq_handler(int32_t num, void (*handler)(struct regsisters r));
void remove_irq_handler(int32_t num);