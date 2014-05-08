
; int fzx_putc(uchar c)

PUBLIC _fzx_putc

_fzx_putc:

   pop af
   pop hl
   
   push hl
   push af

   ld a,l
   
   push ix
   
   call asm_fzx_putc
   
   pop ix
   ret
   
   INCLUDE "font/fzx/arch/spectrum/z80/asm_fzx_putc.asm"
