
; wv_stack_t *wv_stack_init(void *p, size_t capacity, size_t max_size)

PUBLIC wv_stack_init_callee

EXTERN w_vector_init_callee

;defc wv_stack_init_callee = w_vector_init_callee

wv_stack_init_callee:

   jp w_vector_init_callee

INCLUDE "adt/wv_stack/z80/asm_wv_stack_init.asm"
