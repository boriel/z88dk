
; float atan(float x) __z88dk_fastcall

SECTION code_fp_math48

PUBLIC cm48_sdcciy_atan

EXTERN cm48_sdcciyp_dx2m48, am48_atan, cm48_sdcciyp_m482d

cm48_sdcciy_atan:

   call cm48_sdcciyp_dx2m48
   
   call am48_atan
   
   jp cm48_sdcciyp_m482d