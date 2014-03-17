
; ===============================================================
; Feb 2014
; ===============================================================
; 
; void *p_queue_back(p_queue_t *q)
;
; Return item at back of queue without removing it from the queue.
;
; ===============================================================

XLIB asm_p_queue_back

LIB asm_p_forward_list_alt_back

defc asm_p_queue_back = asm_p_forward_list_alt_back

   ; enter : hl = queue *
   ;
   ; exit  : success
   ;
   ;            hl = void *item (last item in list)
   ;            carry reset
   ;
   ;         fail if list is empty
   ;
   ;            hl = 0
   ;            carry set, errno = EINVAL
   ;
   ; uses  : af, hl
