
; void *zx_pxy2aaddr_callee(uchar x, uchar y)

PUBLIC zx_pxy2aaddr

EXTERN asm_zx_pxy2aaddr

zx_pxy2aaddr:

   pop af
   pop de
   pop hl
   
   push hl
   push de
   push af
   
   ld h,e
   jp asm_zx_pxy2aaddr
