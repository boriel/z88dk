
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; l_htou
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

INCLUDE "clib_cfg.asm"

XLIB l_htou

l_htou:

   ; ascii hex string to unsigned integer
   ; whitespace is not skipped, leading 0x not interpretted
   ; char consumption stops on overflow
   ;
   ; enter : de = char *buffer
   ;
   ; exit  : de = & next char to interpret in buffer
   ;         hl = unsigned result (0 on invalid input)
   ;         carry set on unsigned overflow
   ;
   ; uses  : af, bc, de, hl

IF __CLIB_OPT_TXT2NUM_SELECT & $08

   LIB l_fast_htou
   jp l_fast_htou

ELSE

   LIB l_small_htou
   jp l_small_htou

ENDIF
