
; size_t w_vector_erase_range(w_vector_t *v, size_t idx_first, size_t idx_last)

PUBLIC w_vector_erase_range_callee

EXTERN w_array_erase_range_callee

;defc w_vector_erase_range_callee = w_array_erase_range_callee

w_vector_erase_range_callee:

   jp w_array_erase_range_callee

INCLUDE "adt/w_vector/z80/asm_w_vector_erase_range.asm"
