
INCLUDE "clib_cfg.asm"

SECTION code_fcntl

PUBLIC cpm_01_output_dcio_oterm_msg_bell
PUBLIC cpm_01_output_dcio_oterm_msg_bell_0

EXTERN __CPM_DCIO
EXTERN asm_cpm_bdos_alt

cpm_01_output_dcio_oterm_msg_bell:

   ;   can use:  af, bc, de, hl

   bit 0,(ix+7)
   ret z                       ; if bell disabled

cpm_01_output_dcio_oterm_msg_bell_0:

   ld c,__CPM_DCIO             ; bdos direct console i/o
   ld e,CHAR_CTRL_G
   jp asm_cpm_bdos_alt