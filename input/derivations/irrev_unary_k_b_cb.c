
#include <math.h>

double irrev_unary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    return_val = Z*(1 - exp(-Y*k_f*t));
    return return_val;
}
