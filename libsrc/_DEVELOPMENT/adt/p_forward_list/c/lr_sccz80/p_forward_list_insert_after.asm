
; void *p_forward_list_insert_after(void *list_item, void *item)

PUBLIC p_forward_list_insert_after

EXTERN asm_p_forward_list_insert_after

p_forward_list_insert_after:

   pop af
   pop de
   pop hl
   
   push hl
   push de
   push af
   
   jp asm_p_forward_list_insert_after
