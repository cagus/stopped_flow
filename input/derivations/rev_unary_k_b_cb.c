
#include <math.h>

double rev_unary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    return_val = Y*Z*k_f*(1 - exp(-t*(Y*k_f + k_b)))/(Y*k_f + k_b);
    return return_val;
}
