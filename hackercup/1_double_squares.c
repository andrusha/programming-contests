#include <stdlib.h>
#include <stdio.h>
#include <math.h>

unsigned factorize(unsigned n) {
    unsigned res = 0, x2n = 0, x2n1, xn = 0, xn1 = 0;
    unsigned up = (unsigned)sqrt(n);
    float sq = 0;

    if (n == 0 || n == 1)
        return 1;

    for (xn1 = 1; xn1 < up; ++xn1) {
        x2n1 = x2n + xn + xn1;
        xn  = xn1;
        x2n = x2n1;

        sq = sqrt(n - x2n1);
        res += (sq == floor(sq));
    }

    return res;
}

int main(int argc, char *argv[]) {
    FILE * f = fopen(argv[1], "r");
    int n = 0, x;
    fscanf(f, "%i", &n);
    for (; n; --n) {
        fscanf(f, "%i", &x);
        printf("%i\n", factorize(x));
    }
}
