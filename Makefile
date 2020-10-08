# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/20 13:11:26 by vmoreau           #+#    #+#              #
#    Updated: 2020/10/08 16:01:39 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

####################################COLOR######################################
#----------------reset----------------#
NC = \033[0m

#-----------Regular Colors------------#
BLACK = \033[0;30m
RED = \033[0;31m
GREEN = \033[32m
YELLOW = \033[33;33m
BLUE = \033[0;34m
PURPLE = \033[35m
CYAN = \033[1;36m
WHITE = \033[0;37m

###################################SOURCES#####################################

SRC +=	srcs/ft_strlen.s		srcs/ft_write.s		srcs/ft_read.s	\
		srcs/ft_strcpy.s		srcs/ft_strcmp.s		srcs/ft_strdup.s	\

#####################################BASIC#####################################

OBJ = $(SRC:%.s=%.o)

EXE = a.out

#####################################RULES#####################################

all: $(NAME)

$(NAME): echoCL $(OBJ) echoOK echoAR
	ar rcs $@ $(OBJ)
	printf "$(GREEN)Compilation Success $(RED)$(NC)\n"

%.o: %.s
	nasm -f elf64 $^
	printf "$(CYAN).$(NC)"

clean: echoCLEAN
	rm -rf $(OBJ)

fclean: clean echoFCLEAN
	rm -rf $(NAME)
	rm -rf $(EXE)

re: fclean all

#####################################ECHO######################################
echoCL:
	echo "$(YELLOW)===> Compiling $(RED)Libasm.a$(NC)"
echoOK:
	echo "$(GREEN)OK$(NC)"
echoCLEAN :
	echo "$(PURPLE)===> Cleanning OBJS$(NC)"
echoFCLEAN :
	echo "$(PURPLE)===> Cleanning Exec$(NC)"
echoAR :
	echo "$(CYAN)===> Archiving Liasm$(NC)"

.PHONY : all clean fclean re
.SILENT :