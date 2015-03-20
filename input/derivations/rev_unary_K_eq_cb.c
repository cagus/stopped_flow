
#include <math.h>

double rev_unary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    return_val = Y*Z*k_f*(1 - exp(-t*(Y*k_f + k_f/K_eq)))/(Y*k_f + k_f/K_eq);
    return return_val;
}
