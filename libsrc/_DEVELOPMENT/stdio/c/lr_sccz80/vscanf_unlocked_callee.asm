
; int vscanf_unlocked(const char *format, void *arg)

PUBLIC vscanf_unlocked_callee

vscanf_unlocked_callee:

   pop af
   pop bc
   pop de
   push af
   
   INCLUDE "stdio/z80/asm_vscanf_unlocked.asm"
