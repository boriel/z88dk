
; int ispunct(int c)

PUBLIC ispunct

EXTERN asm_ispunct, error_zc

ispunct:

   inc h
   dec h
   jp nz, error_zc

   ld a,l
   call asm_ispunct
   
   ld l,h
   ret c
   
   inc l
   ret
