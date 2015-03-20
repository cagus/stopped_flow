## Mako templated Cython source
# -*- coding: utf-8 -*-

# distutils: extra_compile_args = -std=c99

cimport numpy as cnp
import numpy as np

cdef extern from "analytic.c":
%for name in NAMES:
%for param in PARAMS:
    void ${name}_${param}_arr(const double * const, int, double, double, double, double, double *)
%endfor
%endfor

%for name in NAMES:
%for param in PARAMS:
def ${name}_${param}(double [::1] tarr, double Y, double Z, double k_f, double ${param}):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    ${name}_${param}_arr(&tarr[0], tarr.size, Y, Z, k_f, ${param}, &out[0])
    return out
%endfor
%endfor
