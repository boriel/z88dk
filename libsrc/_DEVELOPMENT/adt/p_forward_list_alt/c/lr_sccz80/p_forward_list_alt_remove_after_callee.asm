
; void *p_forward_list_alt_remove_after(p_forward_list_alt_t *list, void *list_item)

PUBLIC p_forward_list_alt_remove_after_callee

p_forward_list_alt_remove_after_callee:

   pop af
   pop hl
   pop bc
   push af
   
   INCLUDE "adt/p_forward_list_alt/z80/asm_p_forward_list_alt_remove_after.asm"
