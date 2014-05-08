
PUBLIC __stdio_scanf_lp

EXTERN __stdio_scanf_lx

__stdio_scanf_lp:

   jp __stdio_scanf_lx

;defc __stdio_scanf_lp = __stdio_scanf_lx

   ; %lx, %lp converter called from vfscanf()
   ;
   ; enter : ix = FILE *
   ;         de = void *buffer
   ;         bc = field width (0 means default)
   ;         hl = unsigned long *p
   ;
   ; exit  : carry set if error
   ;
   ; uses  : all except ix
