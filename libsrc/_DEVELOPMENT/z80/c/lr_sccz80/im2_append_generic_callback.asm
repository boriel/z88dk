
; void im2_append_generic_callback(uint8_t vector, void *callback)

PUBLIC im2_append_generic_callback

EXTERN asm_im2_append_generic_callback

im2_append_generic_callback:

   pop af
   pop de
   pop hl
   
   push hl
   push de
   push af
   
   jp asm_im2_append_generic_callback
