
#include <math.h>

double rev_binary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    double P = sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_b, 2));
double Q = -Y*k_f - Z*k_f - k_b + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_b, 2));
double R = Y*k_f + Z*k_f + k_b + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_b, 2));
return_val = -1.0L/2.0L*Q*(exp(P*t) - 1)/(a*(Q/R + exp(P*t)));
    return return_val;
}
