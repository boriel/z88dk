
; void *w_vector_at(b_vector_t *v, size_t idx)

PUBLIC w_vector_at

EXTERN w_array_at

;defc w_vector_at = w_array_at

w_vector_at:

   jp w_array_at
