import numpy
cimport numpy
import time
ctypedef signed long US0
cdef class Tuple0:
    cdef readonly signed long v0
    cdef readonly object v1
    def __init__(self, signed long v0, v1): self.v0 = v0; self.v1 = v1
cdef class Mut0:
    cdef public signed long v0
    def __init__(self, signed long v0): self.v0 = v0
cdef bint method0(Mut0 v0) except *:
    cdef signed long v1
    v1 = v0.v0
    return v1 < (<signed long>100000)
cdef bint method2(signed long v0, Mut0 v1) except *:
    cdef signed long v2
    v2 = v1.v0
    return v2 < v0
cdef numpy.ndarray[float,ndim=1] method1(numpy.ndarray[object,ndim=1] v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long v2
    cdef unsigned long long tmp0
    cdef bint v3
    cdef bint v4
    cdef bint v5
    cdef Mut0 v6
    cdef signed long v8
    cdef signed long v9
    cdef numpy.ndarray[signed long,ndim=1] v10
    cdef Tuple0 tmp1
    cdef signed long v11
    cdef signed long v12
    cdef bint v13
    cdef bint v15
    cdef bint v16
    cdef str v17
    cdef signed long v18
    cdef signed long v19
    cdef signed long v20
    cdef unsigned long long tmp2
    cdef bint v21
    cdef bint v22
    cdef bint v23
    cdef signed long v24
    cdef Mut0 v25
    cdef signed long v27
    cdef US0 v28
    cdef signed long v29
    cdef signed long v30
    cdef signed long v31
    cdef signed long v32
    cdef signed long v33
    cdef signed long v34
    v1 = numpy.zeros((<signed long>33),dtype=numpy.float32)
    tmp0 = len(v0)
    if <signed long>tmp0 != tmp0: raise Exception("The conversion to signed long failed.")
    v2 = <signed long>tmp0
    v3 = v2 <= (<signed long>2)
    v4 = v3 == 0
    if v4:
        raise Exception("Pickling failure. The given array is too large.")
    else:
        pass
    v5 = v2 == (<signed long>0)
    if v5:
        v1[(<signed long>0)] = (<float>1)
    else:
        pass
    v6 = Mut0((<signed long>0))
    while method2(v2, v6):
        v8 = v6.v0
        tmp1 = v0[v8]
        v9, v10 = tmp1.v0, tmp1.v1
        del tmp1
        v11 = v8 * (<signed long>16)
        v12 = (<signed long>1) + v11
        v13 = (<signed long>0) <= v9
        if v13:
            v15 = v9 < (<signed long>3)
        else:
            v15 = 0
        v16 = v15 == 0
        if v16:
            v17 = f'Pickling failure. Int value out of bounds. Got: {v9} Size: {(<signed long>3)}'
            raise Exception(v17)
        else:
            pass
        v18 = v12 + v9
        v1[v18] = (<float>1)
        v19 = v12 + (<signed long>3)
        tmp2 = len(v10)
        if <signed long>tmp2 != tmp2: raise Exception("The conversion to signed long failed.")
        v20 = <signed long>tmp2
        v21 = v20 <= (<signed long>4)
        v22 = v21 == 0
        if v22:
            raise Exception("Pickling failure. The given array is too large.")
        else:
            pass
        v23 = v20 == (<signed long>0)
        if v23:
            v1[v19] = (<float>1)
        else:
            pass
        v24 = v19 + (<signed long>1)
        v25 = Mut0((<signed long>0))
        while method2(v20, v25):
            v27 = v25.v0
            v28 = v10[v27]
            v29 = v27 * (<signed long>3)
            v30 = v24 + v29
            if v28 == 0: # Call
                v1[v30] = (<float>1)
            elif v28 == 1: # Fold
                v31 = v30 + (<signed long>1)
                v1[v31] = (<float>1)
            elif v28 == 2: # Raise
                v32 = v30 + (<signed long>2)
                v1[v32] = (<float>1)
            v33 = v27 + (<signed long>1)
            v25.v0 = v33
        del v10
        del v25
        v34 = v8 + (<signed long>1)
        v6.v0 = v34
    del v6
    return v1
cpdef void main() except *:
    cdef US0 v0
    cdef US0 v1
    cdef US0 v2
    cdef US0 v3
    cdef numpy.ndarray[signed long,ndim=1] v4
    cdef US0 v5
    cdef numpy.ndarray[signed long,ndim=1] v6
    cdef numpy.ndarray[object,ndim=1] v7
    cdef double v8
    cdef Mut0 v9
    cdef signed long v11
    cdef numpy.ndarray[float,ndim=1] v12
    cdef signed long v13
    cdef double v14
    cdef double v15
    v0 = 0
    v1 = 2
    v2 = 2
    v3 = 0
    v4 = numpy.empty(4,dtype=numpy.int32)
    v4[0] = v0; v4[1] = v1; v4[2] = v2; v4[3] = v3
    v5 = 0
    v6 = numpy.empty(1,dtype=numpy.int32)
    v6[0] = v5
    v7 = numpy.empty(2,dtype=object)
    v7[0] = Tuple0((<signed long>0), v4); v7[1] = Tuple0((<signed long>2), v6)
    del v4; del v6
    pass # import time
    v8 = time.perf_counter()
    v9 = Mut0((<signed long>0))
    while method0(v9):
        v11 = v9.v0
        v12 = method1(v7)
        del v12
        v13 = v11 + (<signed long>1)
        v9.v0 = v13
    del v7
    del v9
    v14 = time.perf_counter()
    v15 = v14 - v8
    print(v15)
