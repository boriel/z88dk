
; int ungetc_unlocked(int c, FILE *stream)

PUBLIC ungetc_unlocked_callee

ungetc_unlocked_callee:

   pop hl
   pop ix
   ex (sp),hl
   
   INCLUDE "stdio/z80/asm_ungetc_unlocked.asm"
