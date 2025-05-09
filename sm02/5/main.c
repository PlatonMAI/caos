#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

size_t supercall(char *a, size_t a_size, char *b, size_t b_size, char *c);

void read_num(char * num, size_t size) {
    while (size--) {
        unsigned byte;
        scanf("%02X", &byte);
        *num++ = (uint8_t)byte;
    }
}

void print_num(char *num, size_t size) {
    while (size--) {
        printf("%02x", (unsigned)(uint8_t)(*num++));
    }
    printf("\n");
}

int main() {
    size_t a_size, b_size;
    scanf("%zu %zu", &a_size, &b_size);
    char * a = malloc(a_size);
    char * b = malloc(b_size);
    read_num(a, a_size);
    read_num(b, b_size);
    char * c = malloc(((a_size > b_size) ? a_size : b_size) + 1);
    size_t c_size = supercall(a, a_size, b, b_size, c);
    printf("size: %ld\n", c_size);
    print_num(c, c_size);
    free(a);
    free(b);
    free(c);
}
