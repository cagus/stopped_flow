# -*- coding: utf-8 -*-

# distutils: extra_compile_args = -std=c99

cimport numpy as cnp
import numpy as np

cdef extern from "analytic.c":
    void rev_binary_K_eq_arr(const double * const, int, double, double, double, double, double *)
    void rev_binary_k_b_arr(const double * const, int, double, double, double, double, double *)
    void rev_unary_K_eq_arr(const double * const, int, double, double, double, double, double *)
    void rev_unary_k_b_arr(const double * const, int, double, double, double, double, double *)
    void irrev_binary_K_eq_arr(const double * const, int, double, double, double, double, double *)
    void irrev_binary_k_b_arr(const double * const, int, double, double, double, double, double *)
    void irrev_unary_K_eq_arr(const double * const, int, double, double, double, double, double *)
    void irrev_unary_k_b_arr(const double * const, int, double, double, double, double, double *)

def rev_binary_K_eq(double [::1] tarr, double Y, double Z, double k_f, double K_eq):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    rev_binary_K_eq_arr(&tarr[0], tarr.size, Y, Z, k_f, K_eq, &out[0])
    return out
def rev_binary_k_b(double [::1] tarr, double Y, double Z, double k_f, double k_b):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    rev_binary_k_b_arr(&tarr[0], tarr.size, Y, Z, k_f, k_b, &out[0])
    return out
def rev_unary_K_eq(double [::1] tarr, double Y, double Z, double k_f, double K_eq):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    rev_unary_K_eq_arr(&tarr[0], tarr.size, Y, Z, k_f, K_eq, &out[0])
    return out
def rev_unary_k_b(double [::1] tarr, double Y, double Z, double k_f, double k_b):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    rev_unary_k_b_arr(&tarr[0], tarr.size, Y, Z, k_f, k_b, &out[0])
    return out
def irrev_binary_K_eq(double [::1] tarr, double Y, double Z, double k_f, double K_eq):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    irrev_binary_K_eq_arr(&tarr[0], tarr.size, Y, Z, k_f, K_eq, &out[0])
    return out
def irrev_binary_k_b(double [::1] tarr, double Y, double Z, double k_f, double k_b):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    irrev_binary_k_b_arr(&tarr[0], tarr.size, Y, Z, k_f, k_b, &out[0])
    return out
def irrev_unary_K_eq(double [::1] tarr, double Y, double Z, double k_f, double K_eq):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    irrev_unary_K_eq_arr(&tarr[0], tarr.size, Y, Z, k_f, K_eq, &out[0])
    return out
def irrev_unary_k_b(double [::1] tarr, double Y, double Z, double k_f, double k_b):
    cdef cnp.ndarray[cnp.float64_t, ndim=1] out = np.empty(tarr.size)
    irrev_unary_k_b_arr(&tarr[0], tarr.size, Y, Z, k_f, k_b, &out[0])
    return out
