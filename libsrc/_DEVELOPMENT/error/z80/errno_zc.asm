
PUBLIC errno_zc

EXTERN _errno

EXTERN error_zc

errno_zc:

   ; set errno=hl
   ; set hl=0
   ; set carry flag

   ld (_errno),hl
   jp error_zc
