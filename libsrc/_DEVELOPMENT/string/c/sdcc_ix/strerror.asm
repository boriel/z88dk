
; char *strerror(int errnum)

PUBLIC _strerror

_strerror:

   pop af
   pop hl
   
   push hl
   push af
   
   INCLUDE "string/z80/asm_strerror.asm"
