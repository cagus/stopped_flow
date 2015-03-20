#include <math.h>

static double rev_binary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    double P = sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_f/K_eq, 2));
double Q = -Y*k_f - Z*k_f + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_f/K_eq, 2)) - k_f/K_eq;
double R = Y*k_f + Z*k_f + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_f/K_eq, 2)) + k_f/K_eq;
return_val = -1.0L/2.0L*Q*(exp(P*t) - 1)/(k_f*(Q/R + exp(P*t)));
    return return_val;
}

void rev_binary_K_eq_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double K_eq, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = rev_binary_K_eq(tarr[i], Y, Z, k_f, K_eq);
    }
}


static double rev_binary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    double P = sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_b, 2));
double Q = -Y*k_f - Z*k_f - k_b + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_b, 2));
double R = Y*k_f + Z*k_f + k_b + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_b, 2));
return_val = -1.0L/2.0L*Q*(exp(P*t) - 1)/(k_f*(Q/R + exp(P*t)));
    return return_val;
}

void rev_binary_k_b_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double k_b, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = rev_binary_k_b(tarr[i], Y, Z, k_f, k_b);
    }
}


static double rev_unary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    return_val = Y*Z*k_f*(1 - exp(-t*(Y*k_f + k_f/K_eq)))/(Y*k_f + k_f/K_eq);
    return return_val;
}

void rev_unary_K_eq_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double K_eq, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = rev_unary_K_eq(tarr[i], Y, Z, k_f, K_eq);
    }
}


static double rev_unary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    return_val = Y*Z*k_f*(1 - exp(-t*(Y*k_f + k_b)))/(Y*k_f + k_b);
    return return_val;
}

void rev_unary_k_b_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double k_b, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = rev_unary_k_b(tarr[i], Y, Z, k_f, k_b);
    }
}


static double irrev_binary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    return_val = Y*(-exp(k_f*t*(-Y + Z)) + 1)/(Y/Z - exp(k_f*t*(-Y + Z)));
    return return_val;
}

void irrev_binary_K_eq_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double K_eq, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = irrev_binary_K_eq(tarr[i], Y, Z, k_f, K_eq);
    }
}


static double irrev_binary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    return_val = Y*(-exp(k_f*t*(-Y + Z)) + 1)/(Y/Z - exp(k_f*t*(-Y + Z)));
    return return_val;
}

void irrev_binary_k_b_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double k_b, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = irrev_binary_k_b(tarr[i], Y, Z, k_f, k_b);
    }
}


static double irrev_unary_K_eq(double t, double Y, double Z, double k_f, double K_eq){
    double return_val;
    return_val = Z*(1 - exp(-Y*k_f*t));
    return return_val;
}

void irrev_unary_K_eq_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double K_eq, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = irrev_unary_K_eq(tarr[i], Y, Z, k_f, K_eq);
    }
}


static double irrev_unary_k_b(double t, double Y, double Z, double k_f, double k_b){
    double return_val;
    return_val = Z*(1 - exp(-Y*k_f*t));
    return return_val;
}

void irrev_unary_k_b_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double k_b, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = irrev_unary_k_b(tarr[i], Y, Z, k_f, k_b);
    }
}


