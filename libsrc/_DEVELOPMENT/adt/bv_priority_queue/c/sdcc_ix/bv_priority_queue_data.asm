
; void *bv_priority_queue_data(bv_priority_queue_t *q)

PUBLIC _bv_priority_queue_data

EXTERN _ba_priority_queue_data

_bv_priority_queue_data:

   jp _ba_priority_queue_data

   INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_data.asm"
