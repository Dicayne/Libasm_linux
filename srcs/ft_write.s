			section .text
			global ft_write
			extern __errno_location

;ssize_t rax	ft_write(int rdi, const void *rsi, size_t rdx);
ft_write:
			push rbp
			mov rbp, rsp
			xor rax, rax
			call __errno_location
			mov rbx, rax
			mov rax, 1
			syscall
			cmp rax, 0
			jge return
			neg rax
			mov [rbx], rax
			mov rax, -1
return:
			leave
			ret
