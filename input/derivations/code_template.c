## templated C99 source code.
#include <math.h>

%for name in NAMES:
%for param in PARAMS:
static double ${name}_${param}(double t, double Y, double Z, double k_f, double ${param}){
    double return_val;
    ${body}
    return return_val;
}

void ${name}_${param}_arr(const double * const restrict tarr, int nt, double Y,
        double Z, double k_f, double ${param}, double * const restrict out){
    for (int i=0; i<nt; ++i){
        out[i] = ${name}_${param}(tarr[i], Y, Z, k_f, ${param});
    }
}
%endfor
%endfor
