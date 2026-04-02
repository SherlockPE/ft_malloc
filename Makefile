UNAME := $(shell uname)

CC := gcc

# CFLAGS := -Wall -Wextra -Werror -O3
# CFLAGS := -Wall -Wextra -fsanitize=address -g3
# CFLAGS := -Wall -Wextra -Werror -g3
CFLAGS := -Wall -Wextra -Werror

LIBS := -lreadline -Llib/libft -lft

INCLUDE := -I include

#Según el subject:
# El Makefile debe verificar la existerncia de la variable de entorno $HOSTTYPE, si no existe o se asigna con lo siguiente
ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

SRC_DIR		:= src
OBJ_DIR		:= obj
UTILS_DIR	:= utils

# SOURCES
SOURCES :=	

# UTILS
UTILITIES := 

ALL_UTILS := $(UTILITIES)

UTILS := $(addprefix $(UTILS_DIR)/, $(ALL_UTILS))

SRCS := $(addprefix $(SRC_DIR)/, $(SOURCES))

OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

NAME := libft_malloc_${HOSTTYPE}.so

print:
	@echo Mi nombre es: [$(HOSTTYPE)]
	@echo Mi nombre es: [$(NAME)]

all: $(OBJ_DIR) $(NAME)

$(NAME): $(OBJ)
	$(AR) -rcs $(CFLAGS) $(NAME) $(OBJ)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)/$(UTILS_DIR)
	mkdir -p $(OBJ_DIR)/$(UTILS_DIR)/env
	mkdir -p $(OBJ_DIR)/$(UTILS_DIR)/free
	mkdir -p $(OBJ_DIR)/$(UTILS_DIR)/array
	mkdir -p $(OBJ_DIR)/built-ins
	mkdir -p $(OBJ_DIR)/parser
	mkdir -p $(OBJ_DIR)/redirection
	mkdir -p $(OBJ_DIR)/signals
	mkdir -p $(OBJ_DIR)/executor

$(LIBFT):
	$(MAKE) -C lib/libft

clean:
	$(MAKE) clean -C lib/libft
	rm -rf $(OBJ_DIR)

fclean: clean
	$(MAKE) fclean -C lib/libft
	rm -f $(NAME)

re: fclean all

.PHONY: all fclean clean re
# .SILENT: all fclean clean re $(NAME)