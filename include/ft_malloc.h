#ifndef FT_MALLOC_H

# define FT_MALLOC_H

#include <libft.h>

// Within the mandatory part, you are allowed to use the following functions:
// ◦ mmap(2)
// ◦ munmap(2) --> deletes the mappings for the specified address range (enntiendo que con esto hago el free)
// ◦ getpagesize under OSX or sysconf(_SC_PAGESIZE) under linux
// ◦ getrlimit(2)
// The authorized functions within your libft (write(2) for example)
// ◦ The functions from libpthread

// void free(void *ptr);
// void *malloc(size_t size);
// void *realloc(void *ptr, size_t size);


// You must use the mmap(2) and munmap(2) system calls to request and return
// memory zones to the system.


//  function that allows visualization of the state of the allocated
// memory zones. It needs to be prototyped as follows:
void show_alloc_mem();

// The visual 👆 will be formatted by increasing addresses such as:
// TINY : 0xA0000
// 0xA0020 - 0xA004A : 42 bytes
// 0xA006A - 0xA00BE : 84 bytes
// SMALL : 0xAD000
// 0xAD020 - 0xADEAD : 3725 bytes
// LARGE : 0xB0000
// 0xB0020 - 0xBBEEF : 48847 bytes
// Total : 52698 bytes

void    *ft_malloc(size_t size);



#endif