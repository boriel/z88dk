
; void *memcpy(void * restrict s1, const void * restrict s2, size_t n)

PUBLIC memcpy

EXTERN asm_memcpy

memcpy:

   pop af
   pop bc
   pop hl
   pop de
   
   push de
   push hl
   push bc
   push af
   
   jp asm_memcpy
