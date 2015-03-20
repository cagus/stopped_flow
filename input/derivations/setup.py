from distutils.core import setup
from Cython.Build import cythonize

setup(
    name = "analytic",
    ext_modules = cythonize('_analytic.pyx'),
)
