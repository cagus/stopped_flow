
#include <math.h>

double irrev_unary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    return_val = Z*(1 - exp(-Y*k_f*t));
    return return_val;
}
