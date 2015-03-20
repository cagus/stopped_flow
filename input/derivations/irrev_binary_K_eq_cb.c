
#include <math.h>

double irrev_binary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    return_val = Y*(-exp(k_f*t*(-Y + Z)) + 1)/(Y/Z - exp(k_f*t*(-Y + Z)));
    return return_val;
}
