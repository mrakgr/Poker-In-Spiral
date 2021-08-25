# import numpy as np
# import pyximport
# pyximport.install(language_level=3,setup_args={"include_dirs":np.get_include()})

import numpy as np
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup(
    name="Test app",
    ext_modules=cythonize(
        Extension(
            "array_bench", ["array_bench.pyx"],
            extra_compile_args=["-O2"],
            language="c++",
            define_macros=[("NPY_NO_DEPRECATED_API", "NPY_1_7_API_VERSION")]
        ),
        annotate=True,
        language_level=3
    ),
    include_dirs=np.get_include()
)

# from array_bench import main
# main()