
; ===============================================================
; Feb 2014
; ===============================================================
; 
; int wa_stack_empty(wa_stack_t *s)
;
; Return true (non-zero) if stack is empty.
;
; ===============================================================

PUBLIC asm_wa_stack_empty

EXTERN l_testword_hl

asm_wa_stack_empty:

   jp l_testword_hl - 2

;defc asm_wa_stack_empty = l_testword_hl - 2

   ; enter : hl = stack *
   ;
   ; exit  : if stack is empty
   ;
   ;           hl = 1
   ;           z flag set
   ;
   ;         if stack is not empty
   ;
   ;           hl = 0
   ;           nz flag set
   ;
   ; uses  : af, hl
