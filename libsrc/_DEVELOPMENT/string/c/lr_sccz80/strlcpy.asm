
; size_t strlcpy(char * restrict s1, const char * restrict s2, size_t n)

PUBLIC strlcpy

EXTERN asm_strlcpy

strlcpy:

   pop af
   pop bc
   pop hl
   pop de
   
   push de
   push hl
   push bc
   push af
   
   jp asm_strlcpy
