
; size_t strnlen(const char *s, size_t maxlen)

PUBLIC strnlen

EXTERN asm_strnlen

strnlen:

   pop af
   pop bc
   pop hl
   
   push hl
   push bc
   push af
   
   jp asm_strnlen
