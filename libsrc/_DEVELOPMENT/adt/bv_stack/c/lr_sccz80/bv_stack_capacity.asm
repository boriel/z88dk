
; size_t bv_stack_capacity(bv_stack_t *s)

PUBLIC bv_stack_capacity

;defc bv_stack_capacity = asm_bv_stack_capacity

bv_stack_capacity:

   INCLUDE "adt/bv_stack/z80/asm_bv_stack_capacity.asm"
