
; int ba_priority_queue_push(ba_priority_queue_t *q, int c)

PUBLIC ba_priority_queue_push

EXTERN asm_ba_priority_queue_push

ba_priority_queue_push:

   pop af
   pop bc
   pop hl
   
   push hl
   push bc
   push af
   
   jp asm_ba_priority_queue_push
