#include <stdio.h>

int power(int m, int n); // Corrección: Se eliminó el "<" y se agregó un punto y coma al final de la declaración.

int main() {
    int i; // Corrección: Se agregó un punto y coma al final de la declaración.

    for (i = 0; i < 10; ++i) { // Corrección: Se agregaron llaves para delimitar el cuerpo del bucle for.
        printf("%d %d %d\n", i, power(2, i), power(-3, i));
    }
    return 0;
}

int power(int base, int n) {
    int i, p;

    p = 1;
    for (i = 1; i <= n; ++i)
        p = p * base;
    return p;
}


