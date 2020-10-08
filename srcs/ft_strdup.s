			section .text
			global ft_strdup
			extern malloc				;include malloc and ft_strlen function
			extern ft_strlen

;char	*rax ft_strdup(const char *rdi)
ft_strdup:
			xor rax, rax				;initialized rax to 0
find_size:
			call ft_strlen				;call the function ft_strlen(rdi) and stock the return in rax
			push rdi					;save rdi
			mov rdi, rax				;stock rax in rdi
			inc rdi						;increment rdi for the \0 at the end
alloc :
			call malloc				;call the function malloc(rdi) and malloc rax
			cmp rax, 0					;check if rax == NULL -> return -1
			je null
			pop rdi						;restore rdi
			xor rcx, rcx				;initialized rcx to 0
dupli:
			mov dl, BYTE [rdi + rcx]	;stock rdi[rcx] in dl
			cmp dl, 0					;check if dl == \0 -> jump to end layer
			je end
			mov	[rax + rcx], dl			;stock dl in rax[rcx]
			inc rcx						;increment rcx
			jmp dupli					;loop to dupli layer until end layer is called
null:
			xor rcx, rcx				;initialized rcx to 0
			mov BYTE [rax + rcx], 0		;stock rax[rcx] \0
			ret							;return rax
end:
			mov BYTE [rax + rcx], 0		;stock rax[rcx] \0
			ret							;return rax



