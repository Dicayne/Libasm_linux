			section .text
			global ft_strcmp

;int rax	ft_strcmp(const char *rdi, const char *rsi);
ft_strcmp:
			xor rax, rax			;initialized rax, rcx, al, ah to 0
			xor rcx, rcx
			xor al, al
			xor ah, ah
			jmp compare				;jump to compare layer

incr:
			inc rcx					;increment rcx
			jmp compare				;jump to compare layer
check_end:
			cmp BYTE[rdi + rcx], 0	;check if rdi[rcx] != \0 -> jump to incr layer
			jnz incr
			cmp BYTE[rsi + rcx], 0	;check if rsi[rcx] != \0 -> jump to diff_bellow
			jnz diff_bellow
			mov rax, 0				;else if both = \0 return 0
			ret
compare:
			mov ah, BYTE[rsi + rcx]	;stock rsi[rax] in al
			mov al, BYTE[rdi + rcx]	;stock rdi[rax] in ah
			cmp al, ah				;compare ah and al
			ja diff_above			;if diff is above jump to diff_above layer
			jb diff_bellow			;if diff is bellow jump to diff_bellow layer
			je check_end			;else increment and jump to check_end layer
diff_above:
			sub al, ah
			mov ah, 0			;return 1
			ret
diff_bellow:
			sub al, ah
			mov bl, al
			mov rax, 0xffffffff
			mov al, bl				;return -1
			ret

