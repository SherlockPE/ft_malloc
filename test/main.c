#include <ft_malloc.h>

int main(void)
{
    char *str;

    str = ft_malloc(5);

    free(str);
    return 0;
}
