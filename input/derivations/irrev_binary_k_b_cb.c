
#include <math.h>

double irrev_binary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    return_val = Y*(-exp(k_f*t*(-Y + Z)) + 1)/(Y/Z - exp(k_f*t*(-Y + Z)));
    return return_val;
}
