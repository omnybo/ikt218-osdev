#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

void terminal_initialize(void); 
void terminal_setcolor(uint8_t color); 
void terminal_putentryat(char c, uint8_t color, size_t x, size_t y); 
void terminal_putchar(char c);
void terminal_write(const char* data, size_t size); 
void write_string(const char* data); 