
PUBLIC error_efbig_mc

EXTERN __EFBIG

EXTERN errno_mc

   pop hl
   
error_efbig_mc:

   ; set hl=-1
   ; set carry flag
   ; set errno=EFBIG

   ld hl,__EFBIG
   jp errno_mc
