
; ===============================================================
; Dec 2013
; ===============================================================
; 
; void *bsearch(const void *key, const void *base,
;               size_t nmemb, size_t size,
;               int (*compar)(const void *, const void *))
;
; Perform a binary search on a sorted array of items.
;
; ===============================================================

PUBLIC asm_bsearch
PUBLIC asm0_bsearch

EXTERN error_zc, l_mulu_16_16x16, l_jpix, l_inc_sp

asm_bsearch:

   ; enter : hl = nmemb
   ;         de = size
   ;         bc = base
   ;         af = key
   ;         ix = compare
   ;
   ; exit  : ix = compare
   ;
   ;         success
   ;
   ;           carry reset
   ;           hl = address of item in array = p
   ;
   ;         fail
   ;
   ;           carry set
   ;           hl = 0
   ;
   ; uses  : af, bc, de, hl

   push af

asm0_bsearch:
bsearch_loop:

   ld a,h
   or l
   jp z, error_zc - 1

   ; de = size
   ; bc = base
   ; hl = lim
   ; ix = compare
   ; stack = key
  
   pop af
   push hl
   push bc
   push de
   push af
   push bc
   
   srl h
   rr l

   ; hl = lim>>1
   ; de = size
   ; ix = compare
   ; stack = lim, base, size, key, base
   
   call l_mulu_16_16x16        ; hl = hl * de = (lim >> 1) * size
   
   pop de                      ; de = base
   add hl,de                   ; hl = p = base + (lim >> 1) * size
   pop de                      ; de = key

   push de                     ; save key
   push hl                     ; save p
   push ix                     ; save compar

;******************************
IF __SDCC | __SDCC_IX | __SDCC_IY
;******************************

   push hl
   push de
   call l_jpix                 ; (compar)(de = void *key, hl = void *p) R->L
   pop de
   pop bc

;******************************
ELSE
;******************************

   push de
   push hl
   call l_jpix                 ; (compar)(de = void *key, hl = void *p) L->R
   pop bc
   pop de

;******************************
ENDIF
;******************************

   pop ix                      ; ix = compar
   pop bc                      ; bc = p
   pop de                      ; de = key

   ; bc = p
   ; de = key
   ; hl = compare result
   ; ix = compare
   ; stack = lim, base, size
   
   ld a,h
   or a
   jp p, key_greater_equal
   
key_less:

   ; bc = p
   ; de = key
   ; ix = compare
   ; stack = lim, base, size

   ex de,hl
   pop de
   pop bc
   ex (sp),hl
   
   ; de = size
   ; bc = base
   ; hl = lim
   ; ix = compare
   ; stack = key

   srl h
   rr l
   
   jr bsearch_loop

key_greater_equal:

   or l
   jr z, found_item
   
key_greater:

   ; bc = p
   ; de = key
   ; ix = compare
   ; stack = lim, base, size

   pop hl
   push hl
   
   add hl,bc
   ld c,l
   ld b,h
   
   pop hl
   ex de,hl
   
   pop af
   ex (sp),hl
   
   dec hl
   
   srl h
   rr l
   
   ; de = size
   ; bc = base
   ; hl = lim
   ; ix = compare
   ; stack = key
   
   jr bsearch_loop

found_item:

   ; bc = p
   ; de = key
   ; ix = compare
   ; stack = lim, base, size
   ; carry reset

   ld l,c
   ld h,b
   
   jp l_inc_sp - 6             ; pop three items
   
; ============================================================
;
;void * bsearch(
;   register const void *key,
;   const void *base0,
;   size_t nmemb,
;   register size_t size,
;   register int (*compar)(const void *key, const void *b))
;{
;   for (lim = nmemb; lim != 0; lim >>= 1)
;   {
;      p = base + (lim >> 1) * size;
;      
;      cmp = (*compar)(key, p);
;      
;      if (cmp == 0) return ((void *)p);
;      
;      if (cmp > 0)
;      {	
;         /* key > p: move right */
;         
;         base = (char *)p + size;
;         lim--;
;      }
;      
;      /* else move left */
;      
;   }
;
;   return 0;
;}
