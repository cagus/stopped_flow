double P = sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_f/K_eq, 2));
double Q = -Y*k_f - Z*k_f + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_f/K_eq, 2)) - k_f/K_eq;
double R = Y*k_f + Z*k_f + sqrt(-4*Y*Z*pow(k_f, 2) + pow(Y*k_f + Z*k_f + k_f/K_eq, 2)) + k_f/K_eq;
return_val = -1.0L/2.0L*Q*(exp(P*t) - 1)/(k_f*(Q/R + exp(P*t)));