
; void *b_array_append_block(b_array_t *a, size_t n)

PUBLIC b_array_append_block

EXTERN b_array_append_block_entry

b_array_append_block:

   pop af
   pop de
   pop hl
   
   push hl
   push de
   push af
   
   jp b_array_append_block_entry
