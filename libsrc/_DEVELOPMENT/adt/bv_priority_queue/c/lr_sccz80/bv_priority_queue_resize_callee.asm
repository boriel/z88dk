
; int bv_priority_queue_resize(bv_priority_queue_t *q, size_t n)

PUBLIC bv_priority_queue_resize_callee

EXTERN ba_priority_queue_resize_callee

;defc bv_priority_queue_resize_callee = ba_priority_queue_resize_callee

bv_priority_queue_resize_callee:

   jp ba_priority_queue_resize_callee

INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_resize.asm"
