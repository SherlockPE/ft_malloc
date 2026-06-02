UNAME := $(shell uname)

CC := gcc

# CFLAGS := -Wall -Wextra -Werror -O3
# CFLAGS := -Wall -Wextra -fsanitize=address -g3
# CFLAGS := -Wall -Wextra -Werror -g3
CFLAGS := -Wall -Wextra -Werror

INCLUDE := -I include -I libft

#Según el subject:
# El Makefile debe verificar la existerncia de la variable de entorno $HOSTTYPE, si no existe o se asigna con lo siguiente
ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

SRC_DIR		:= src
OBJ_DIR		:= obj

# SOURCES
SOURCES :=	ft_malloc.c

SRCS := $(addprefix $(SRC_DIR)/, $(SOURCES))

OBJ := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

NAME := libft_malloc_${HOSTTYPE}.so
LINK := libft_malloc.so

all: lib_ft $(OBJ_DIR) $(NAME)

print:
	@echo Mi nombre es: [$(HOSTTYPE)]
	@echo Mi nombre es: [$(NAME)]

$(NAME): $(OBJ)
	cp libft/libft.a $(NAME)
	$(AR) -rcs $(NAME) $(OBJ)
	ln -s $(NAME) $(LINK)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

lib_ft:
	$(MAKE) -C libft

clean:
	$(MAKE) clean -C libft
	rm -rf $(OBJ_DIR)

fclean: clean
	$(MAKE) fclean -C libft
	rm -f $(NAME) $(LINK)

run_test:
	$(CC) $(CFLAGS) test/main.c -L. -lft_malloc -I include -I libft

re: fclean all

.PHONY: all print fclean lib_ft clean re run_test
# .SILENT: all fclean clean re $(NAME)