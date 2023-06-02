;This code is highly inspired by Bran's Kernel Development Tutorial and the code from lecture 4
[Global isr1]
[Global isr1]
[Global isr2] ; we make the ISRs and IRQs global so we can use them in the C code
[Global irq0]
[Global irq1]
[Global irq2]
[Global irq3]
[Global irq4]
[Global irq5]
[Global irq6]
[Global irq7]
[Global irq8]
[Global irq9]
[Global irq10]
[Global irq11]
[Global irq12]
[Global irq13]
[Global irq14]
[Global irq15]
extern fault_handler

;Divide by zero exception
isr0: 
  cli      ;disables other interupts
  push byte 0   ;pushes zero because of no error code (dummy error code)
  push byte 0   ;pushes interupt number
  jmp isr_common_stub   ; jumps to the common_stub function

;Debug exception
isr1: 
  cli
  push byte 0
  push byte 1
  jmp isr_common_stub


;Non Maskable Interrupt Exception
isr2 : 
  cli
  push byte 0
  push byte 2
  jmp isr_common_stub

isr3 : 
  cli
  push byte 0
  push byte 2
  jmp isr_common_stub

isr4 : 
  cli
  push byte 0
  push byte 4
  jmp isr_common_stub

isr5 : 
  cli
  push byte 0
  push byte 5
  jmp isr_common_stub

isr6 : 
  cli
  push byte 0
  push byte 6
  jmp isr_common_stub

isr7 : 
  cli
  push byte 0
  push byte 7
  jmp isr_common_stub

isr8 : 
  cli
  push byte 8  ;we dont push zero because of error code
  jmp isr_common_stub

isr9 : 
  cli
  push byte 0
  push byte 9
  jmp isr_common_stub

isr10 : 
  cli
  push byte 10
  jmp isr_common_stub

isr11 : 
  cli
  push byte 11
  jmp isr_common_stub

isr12 : 
  cli
  push byte 12
  jmp isr_common_stub

isr13 : 
  cli
  push byte 13
  jmp isr_common_stub

isr14 : 
  cli
  push byte 14
  jmp isr_common_stub

isr15 : 
  cli
  push byte 0
  push byte 15
  jmp isr_common_stub

isr16 : 
  cli
  push byte 0
  push byte 16
  jmp isr_common_stub

isr17 : 
  cli
  push byte 0
  push byte 17
  jmp isr_common_stub

isr18 : 
  cli
  push byte 0
  push byte 18
  jmp isr_common_stub

isr19 : 
  cli
  push byte 0
  push byte 19
  jmp isr_common_stub

isr20 : 
  cli
  push byte 0
  push byte 20
  jmp isr_common_stub

isr21 : 
  cli
  push byte 0
  push byte 21
  jmp isr_common_stub

isr22 : 
  cli
  push byte 0
  push byte 22
  jmp isr_common_stub

isr23 : 
  cli
  push byte 0
  push byte 23
  jmp isr_common_stub

isr24 : 
  cli
  push byte 0
  push byte 24
  jmp isr_common_stub

isr25 : 
  cli
  push byte 0
  push byte 25
  jmp isr_common_stub

isr26 : 
  cli
  push byte 0
  push byte 26
  jmp isr_common_stub

isr27 : 
  cli
  push byte 0
  push byte 27
  jmp isr_common_stub

isr28 : 
  cli
  push byte 0
  push byte 28
  jmp isr_common_stub

isr29 : 
  cli
  push byte 0
  push byte 29
  jmp isr_common_stub

isr30 : 
  cli
  push byte 0
  push byte 30
  jmp isr_common_stub

isr31 : 
  cli
  push byte 0
  push byte 31
  jmp isr_common_stub

irq0 : 
  cli
  push byte 0
  push byte 32
  jmp irq_common_stub

irq1 : 
  cli
  push byte 0
  push byte 33
  jmp irq_common_stub

irq2 : 
  cli
  push byte 0
  push byte 34
  jmp irq_common_stub

irq3 : 
  cli
  push byte 0
  push byte 35
  jmp irq_common_stub

irq4 : 
  cli
  push byte 0
  push byte 36
  jmp irq_common_stub

irq5 : 
  cli
  push byte 0
  push byte 37
  jmp irq_common_stub

irq6 : 
  cli
  push byte 0
  push byte 38
  jmp irq_common_stub

irq7 : 
  cli
  push byte 0
  push byte 39
  jmp irq_common_stub

irq8 : 
  cli
  push byte 0
  push byte 40
  jmp irq_common_stub

irq9 : 
  cli
  push byte 0
  push byte 41
  jmp irq_common_stub

irq10 : 
  cli
  push byte 0
  push byte 42
  jmp irq_common_stub

irq11 : 
  cli
  push byte 0
  push byte 43
  jmp irq_common_stub

irq12 : 
  cli
  push byte 0
  push byte 44
  jmp irq_common_stub

irq13 : 
  cli
  push byte 0
  push byte 45
  jmp irq_common_stub

irq14 : 
  cli
  push byte 0
  push byte 46
  jmp irq_common_stub

irq15 : 
  cli
  push byte 0
  push byte 47
  jmp irq_common_stub


; The function saves processor state sets up kernel mode segments, calls the fault handler and restores stack frame
isr_common_stub:
  pusha
  push ds
  push es
  push fs
  push gs
  mov ax, 0x10  
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov eax, esp   
  push eax
  mov eax, fault_handler
  call eax       
  pop eax
  pop gs
  pop fs
  pop es
  pop ds
  popa
  add esp, 8
  iret

irq_common_stub:
  pusha
  push ds
  push es
  push fs
  push gs
  mov ax, 0x10
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov eax, esp
  push eax
  mov eax, irq_handler
  call eax
  pop eax
  pop gs
  pop fs
  pop es
  pop ds
  popa
  add esp, 8
  iret