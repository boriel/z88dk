
; bv_stack_t *bv_stack_init(void *p, size_t capacity, size_t max_size)

PUBLIC _bv_stack_init

EXTERN _b_vector_init

_bv_stack_init:

   jp _b_vector_init

   INCLUDE "adt/bv_stack/z80/asm_bv_stack_init.asm"
