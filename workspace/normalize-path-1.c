#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

void discrim(float a, float b, float c, float *res) {
    *res = b * b;
    *res -= 4 * a * c;
}


// int main() {
//     float* res = new float();
//     discrim(1, 1, 1, res);
//     // printf("%f\n", *res);
// }

