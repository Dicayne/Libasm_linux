			section .text
			global ft_read
			extern __errno_location

;ssize_t rax	ft_read(int rdi, void *rsi, size_t rdx);
ft_read:
			push rbp
			mov rbp, rsp
			xor rax, rax
			call __errno_location
			mov rbx, rax
			mov rax, 0
			syscall
			cmp rax, 0
			jge return
			neg rax
			mov [rbx], rax
			mov rax, -1
return:
			leave
			ret
