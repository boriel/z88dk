
; size_t b_array_read_block(void *dst, size_t n, b_array_t *a, size_t idx)

PUBLIC b_array_read_block

EXTERN asm_b_array_read_block

b_array_read_block:

   pop af
   pop bc
   pop hl
   pop de
   exx
   pop de
   
   push de
   exx
   push de
   push hl
   push bc
   push af
   
   jp asm_b_array_read_block
