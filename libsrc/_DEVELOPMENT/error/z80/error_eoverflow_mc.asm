
PUBLIC error_eoverflow_mc

EXTERN __EOVERFLOW

EXTERN errno_mc

   pop hl
   
error_eoverflow_mc:

   ; set hl=-1
   ; set carry flag
   ; set errno=EOVERFLOW

   ld hl,__EOVERFLOW
   jp errno_mc
