
; int bv_priority_queue_reserve(bv_priority_queue_t *q, size_t n)

PUBLIC bv_priority_queue_reserve

EXTERN asm_bv_priority_queue_reserve

bv_priority_queue_reserve:

   pop af
   pop bc
   pop hl
   
   push hl
   push bc
   push af
   
   jp asm_bv_priority_queue_reserve
