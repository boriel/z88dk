
; void *heap_alloc_unlocked(void *heap, size_t size)

PUBLIC heap_alloc_unlocked

EXTERN asm_heap_alloc_unlocked

heap_alloc_unlocked:

   pop af
   pop hl
   pop de
   
   push de
   push hl
   push af
   
   jp asm_heap_alloc_unlocked
