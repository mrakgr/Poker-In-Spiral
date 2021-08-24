import numpy
cimport numpy
cdef class Tuple0:
    cdef readonly signed long long v0
    cdef readonly signed long long v1
    def __init__(self, signed long long v0, signed long long v1): self.v0 = v0; self.v1 = v1
cdef class UH0:
    cdef readonly signed long tag
cdef class UH0_0(UH0): # Cons
    cdef readonly object v0
    cdef readonly UH0 v1
    def __init__(self, v0, UH0 v1): self.tag = 0; self.v0 = v0; self.v1 = v1
cdef class UH0_1(UH0): # Nil
    def __init__(self): self.tag = 1
cdef class Tuple1:
    cdef readonly signed long long v0
    cdef readonly signed long long v1
    cdef readonly signed long long v2
    cdef readonly signed long long v3
    cdef readonly signed long long v4
    def __init__(self, signed long long v0, signed long long v1, signed long long v2, signed long long v3, signed long long v4): self.v0 = v0; self.v1 = v1; self.v2 = v2; self.v3 = v3; self.v4 = v4
cdef class Mut0:
    cdef public signed long long v0
    def __init__(self, signed long long v0): self.v0 = v0
cdef class Tuple2:
    cdef readonly signed long long v0
    cdef readonly signed long long v1
    cdef readonly signed long long v2
    cdef readonly signed long long v3
    cdef readonly signed long long v4
    cdef readonly object v5
    def __init__(self, signed long long v0, signed long long v1, signed long long v2, signed long long v3, signed long long v4, v5): self.v0 = v0; self.v1 = v1; self.v2 = v2; self.v3 = v3; self.v4 = v4; self.v5 = v5
ctypedef signed long US0
cdef class Tuple3:
    cdef readonly signed long long v0
    cdef readonly object v1
    def __init__(self, signed long long v0, v1): self.v0 = v0; self.v1 = v1
cdef class US1:
    cdef readonly signed long tag
cdef class US1_0(US1): # Action
    cdef readonly US0 v0
    def __init__(self, US0 v0): self.tag = 0; self.v0 = v0
cdef class US1_1(US1): # Card
    cdef readonly signed long long v0
    def __init__(self, signed long long v0): self.tag = 1; self.v0 = v0
cdef numpy.ndarray[float,ndim=1] method0():
    cdef numpy.ndarray[float,ndim=1] v0
    v0 = numpy.zeros((<signed long long>1),dtype=numpy.float32)
    v0[(<signed long long>0)] = (<float>1)
    return v0
cdef void method2(numpy.ndarray[float,ndim=1] v0) except *:
    cdef float v1
    cdef bint v2
    cdef bint v4
    cdef bint v5
    cdef signed long long v6
    cdef bint v7
    cdef bint v8
    v1 = v0[(<signed long long>0)]
    v2 = v1 == (<float>0)
    if v2:
        v4 = 1
    else:
        v4 = v1 == (<float>1)
    v5 = v4 == 0
    if v5:
        raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
    else:
        pass
    v6 = <signed long long>v1
    v7 = v6 == (<signed long long>1)
    v8 = v7 == 0
    if v8:
        raise Exception("Invalid format.")
    else:
        pass
cdef void method1() except *:
    cdef numpy.ndarray[float,ndim=1] v0
    v0 = method0()
    method2(v0)
cdef numpy.ndarray[float,ndim=1] method3(signed long long v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef bint v2
    cdef bint v4
    cdef bint v5
    cdef str v6
    v1 = numpy.zeros((<signed long long>5),dtype=numpy.float32)
    v2 = (<signed long long>0) <= v0
    if v2:
        v4 = v0 < (<signed long long>5)
    else:
        v4 = 0
    v5 = v4 == 0
    if v5:
        v6 = f'Pickling failure. Int value out of bounds. Got: {v0} Size: {(<signed long long>5)}'
        raise Exception(v6)
    else:
        pass
    v1[v0] = (<float>1)
    return v1
cdef numpy.ndarray[float,ndim=1] method4(signed long long v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef bint v2
    cdef bint v4
    cdef bint v5
    cdef str v6
    v1 = numpy.zeros((<signed long long>7),dtype=numpy.float32)
    v2 = (<signed long long>0) <= v0
    if v2:
        v4 = v0 < (<signed long long>7)
    else:
        v4 = 0
    v5 = v4 == 0
    if v5:
        v6 = f'Pickling failure. Int value out of bounds. Got: {v0} Size: {(<signed long long>7)}'
        raise Exception(v6)
    else:
        pass
    v1[v0] = (<float>1)
    return v1
cdef Tuple0 method8(signed long long v0, numpy.ndarray[float,ndim=1] v1, signed long long v2, signed long long v3, signed long long v4):
    cdef bint v5
    cdef signed long long v6
    cdef float v7
    cdef bint v8
    cdef signed long long v15
    cdef signed long long v16
    cdef bint v9
    cdef signed long long v10
    v5 = v2 < v0
    if v5:
        v6 = v2 + (<signed long long>1)
        v7 = v1[v2]
        v8 = v7 == (<float>0)
        if v8:
            v15, v16 = v3, v4
        else:
            v9 = v7 == (<float>1)
            if v9:
                v10 = v4 + (<signed long long>1)
                v15, v16 = v2, v10
            else:
                raise Exception("Unpickling failure. The int type must either be active or inactive.")
        return method8(v0, v1, v6, v15, v16)
    else:
        return Tuple0(v3, v4)
cdef Tuple0 method7(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2):
    cdef signed long long v3
    cdef signed long long v4
    cdef signed long long v5
    cdef signed long long v6
    cdef Tuple0 tmp0
    cdef bint v7
    cdef bint v8
    cdef signed long long v9
    v3 = (<signed long long>0)
    v4 = (<signed long long>0)
    tmp0 = method8(v2, v0, v1, v3, v4)
    v5, v6 = tmp0.v0, tmp0.v1
    del tmp0
    v7 = v6 <= (<signed long long>1)
    v8 = v7 == 0
    if v8:
        raise Exception("Unpickling failure. Too many active indices in the one-hot vector.")
    else:
        pass
    v9 = v5 - v1
    return Tuple0(v9, v6)
cdef signed long long method6(numpy.ndarray[float,ndim=1] v0) except *:
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp1
    cdef bint v5
    cdef bint v6
    v1 = (<signed long long>0)
    v2 = v1 + (<signed long long>5)
    tmp1 = method7(v0, v1, v2)
    v3, v4 = tmp1.v0, tmp1.v1
    del tmp1
    v5 = v4 == (<signed long long>1)
    v6 = v5 == 0
    if v6:
        raise Exception("Invalid format.")
    else:
        pass
    return v3
cdef void method5(signed long long v0) except *:
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    cdef bint v3
    cdef bint v4
    v1 = method3(v0)
    v2 = method6(v1)
    del v1
    v3 = v0 == v2
    v4 = v3 == 0
    if v4:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef signed long long method10(numpy.ndarray[float,ndim=1] v0) except *:
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp2
    cdef bint v5
    cdef bint v6
    v1 = (<signed long long>0)
    v2 = v1 + (<signed long long>7)
    tmp2 = method7(v0, v1, v2)
    v3, v4 = tmp2.v0, tmp2.v1
    del tmp2
    v5 = v4 == (<signed long long>1)
    v6 = v5 == 0
    if v6:
        raise Exception("Invalid format.")
    else:
        pass
    return v3
cdef void method9(signed long long v0) except *:
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    cdef bint v3
    cdef bint v4
    v1 = method4(v0)
    v2 = method10(v1)
    del v1
    v3 = v0 == v2
    v4 = v3 == 0
    if v4:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef signed long long method13(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2, signed long long v3) except *:
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef float v12
    cdef signed long long v13
    v4 = v2 < (<signed long long>10)
    if v4:
        v5 = v2 + (<signed long long>1)
        v6 = (<signed long long>10) - v2
        v7 = v6 - (<signed long long>1)
        v8 = <signed long>v7
        v9 = (<signed long long>1) << v8
        v10 = v1 + v2
        v11 = v3 // v9
        v12 = <float>v11
        v0[v10] = v12
        v13 = v3 % v9
        return method13(v0, v1, v5, v13)
    else:
        return v3
cdef void method12(signed long long v0, numpy.ndarray[float,ndim=1] v1, signed long long v2) except *:
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef str v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    v3 = (<signed long long>0) <= v0
    if v3:
        v5 = v0 < (<signed long long>1023)
    else:
        v5 = 0
    v6 = v5 == 0
    if v6:
        v7 = f'Pickle failure. Bin int value out of bounds. Got: {v0} Size: {(<signed long long>1023)}'
        raise Exception(v7)
    else:
        pass
    v8 = v0 + (<signed long long>1)
    v9 = (<signed long long>0)
    v10 = method13(v1, v2, v9, v8)
cdef numpy.ndarray[float,ndim=1] method11(signed long long v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    v1 = numpy.zeros((<signed long long>10),dtype=numpy.float32)
    v2 = (<signed long long>0)
    method12(v0, v1, v2)
    return v1
cdef signed long long method15(UH0 v0, signed long long v1) except *:
    cdef UH0 v3
    cdef signed long long v4
    if v0.tag == 0: # Cons
        v3 = (<UH0_0>v0).v1
        v4 = v1 + (<signed long long>1)
        return method15(v3, v4)
    elif v0.tag == 1: # Nil
        return v1
cdef signed long long method16(numpy.ndarray[object,ndim=1] v0, UH0 v1, signed long long v2) except *:
    cdef numpy.ndarray[float,ndim=1] v3
    cdef UH0 v4
    cdef signed long long v5
    if v1.tag == 0: # Cons
        v3 = (<UH0_0>v1).v0; v4 = (<UH0_0>v1).v1
        v0[v2] = v3
        del v3
        v5 = v2 + (<signed long long>1)
        return method16(v0, v4, v5)
    elif v1.tag == 1: # Nil
        return v2
cdef numpy.ndarray[object,ndim=1] method14(UH0 v0):
    cdef signed long long v1
    cdef signed long long v2
    cdef numpy.ndarray[object,ndim=1] v3
    cdef signed long long v4
    cdef signed long long v5
    v1 = (<signed long long>0)
    v2 = method15(v0, v1)
    v3 = numpy.empty(v2,dtype=object)
    v4 = (<signed long long>0)
    v5 = method16(v3, v0, v4)
    return v3
cdef signed long long method20(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2, signed long long v3) except *:
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef float v7
    cdef bint v8
    cdef bint v10
    cdef bint v11
    cdef signed long long v12
    cdef signed long long v13
    cdef signed long long v14
    cdef signed long v15
    cdef signed long long v16
    cdef signed long long v17
    v4 = v2 < (<signed long long>10)
    if v4:
        v5 = v2 + (<signed long long>1)
        v6 = v1 + v2
        v7 = v0[v6]
        v8 = v7 == (<float>0)
        if v8:
            v10 = 1
        else:
            v10 = v7 == (<float>1)
        v11 = v10 == 0
        if v11:
            raise Exception("Unpickling failure. The bin int type must either be active or inactive.")
        else:
            pass
        v12 = <signed long long>v7
        v13 = (<signed long long>10) - v2
        v14 = v13 - (<signed long long>1)
        v15 = <signed long>v14
        v16 = v12 << v15
        v17 = v3 + v16
        return method20(v0, v1, v5, v17)
    else:
        return v3
cdef Tuple0 method19(numpy.ndarray[float,ndim=1] v0, signed long long v1):
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef signed long long v5
    cdef bint v6
    cdef signed long long v7
    v2 = (<signed long long>0)
    v3 = (<signed long long>0)
    v4 = method20(v0, v1, v2, v3)
    v5 = v4 - (<signed long long>1)
    v6 = (<signed long long>0) < v4
    if v6:
        v7 = (<signed long long>1)
    else:
        v7 = (<signed long long>0)
    return Tuple0(v5, v7)
cdef signed long long method18(numpy.ndarray[float,ndim=1] v0) except *:
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef Tuple0 tmp3
    cdef bint v4
    cdef bint v5
    v1 = (<signed long long>0)
    tmp3 = method19(v0, v1)
    v2, v3 = tmp3.v0, tmp3.v1
    del tmp3
    v4 = v3 == (<signed long long>1)
    v5 = v4 == 0
    if v5:
        raise Exception("Invalid format.")
    else:
        pass
    return v2
cdef void method17(signed long long v0) except *:
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    cdef bint v3
    cdef bint v4
    v1 = method11(v0)
    v2 = method18(v1)
    del v1
    v3 = v0 == v2
    v4 = v3 == 0
    if v4:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef signed long long method23(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2, signed long long v3) except *:
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef float v12
    cdef signed long long v13
    v4 = v2 < (<signed long long>5)
    if v4:
        v5 = v2 + (<signed long long>1)
        v6 = (<signed long long>5) - v2
        v7 = v6 - (<signed long long>1)
        v8 = <signed long>v7
        v9 = (<signed long long>1) << v8
        v10 = v1 + v2
        v11 = v3 // v9
        v12 = <float>v11
        v0[v10] = v12
        v13 = v3 % v9
        return method23(v0, v1, v5, v13)
    else:
        return v3
cdef void method22(signed long long v0, numpy.ndarray[float,ndim=1] v1, signed long long v2) except *:
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef str v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    v3 = (<signed long long>0) <= v0
    if v3:
        v5 = v0 < (<signed long long>31)
    else:
        v5 = 0
    v6 = v5 == 0
    if v6:
        v7 = f'Pickle failure. Bin int value out of bounds. Got: {v0} Size: {(<signed long long>31)}'
        raise Exception(v7)
    else:
        pass
    v8 = v0 + (<signed long long>1)
    v9 = (<signed long long>0)
    v10 = method23(v1, v2, v9, v8)
cdef numpy.ndarray[float,ndim=1] method21(signed long long v0, signed long long v1):
    cdef numpy.ndarray[float,ndim=1] v2
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef str v7
    cdef signed long long v8
    v2 = numpy.zeros((<signed long long>11),dtype=numpy.float32)
    v3 = (<signed long long>0) <= v0
    if v3:
        v5 = v0 < (<signed long long>5)
    else:
        v5 = 0
    v6 = v5 == 0
    if v6:
        v7 = f'Pickling failure. Int value out of bounds. Got: {v0} Size: {(<signed long long>5)}'
        raise Exception(v7)
    else:
        pass
    v2[v0] = (<float>1)
    v8 = (<signed long long>5)
    method22(v1, v2, v8)
    v2[(<signed long long>10)] = (<float>1)
    return v2
cdef signed long long method27(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2, signed long long v3) except *:
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef float v7
    cdef bint v8
    cdef bint v10
    cdef bint v11
    cdef signed long long v12
    cdef signed long long v13
    cdef signed long long v14
    cdef signed long v15
    cdef signed long long v16
    cdef signed long long v17
    v4 = v2 < (<signed long long>5)
    if v4:
        v5 = v2 + (<signed long long>1)
        v6 = v1 + v2
        v7 = v0[v6]
        v8 = v7 == (<float>0)
        if v8:
            v10 = 1
        else:
            v10 = v7 == (<float>1)
        v11 = v10 == 0
        if v11:
            raise Exception("Unpickling failure. The bin int type must either be active or inactive.")
        else:
            pass
        v12 = <signed long long>v7
        v13 = (<signed long long>5) - v2
        v14 = v13 - (<signed long long>1)
        v15 = <signed long>v14
        v16 = v12 << v15
        v17 = v3 + v16
        return method27(v0, v1, v5, v17)
    else:
        return v3
cdef Tuple0 method26(numpy.ndarray[float,ndim=1] v0, signed long long v1):
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef signed long long v5
    cdef bint v6
    cdef signed long long v7
    v2 = (<signed long long>0)
    v3 = (<signed long long>0)
    v4 = method27(v0, v1, v2, v3)
    v5 = v4 - (<signed long long>1)
    v6 = (<signed long long>0) < v4
    if v6:
        v7 = (<signed long long>1)
    else:
        v7 = (<signed long long>0)
    return Tuple0(v5, v7)
cdef Tuple0 method25(numpy.ndarray[float,ndim=1] v0):
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef Tuple0 tmp5
    cdef float v8
    cdef bint v9
    cdef bint v11
    cdef bint v12
    cdef signed long long v13
    cdef signed long long v14
    cdef bint v15
    cdef bint v16
    cdef signed long long v17
    cdef signed long long v18
    cdef bint v19
    cdef bint v20
    cdef signed long long v21
    cdef bint v22
    cdef bint v23
    v1 = (<signed long long>0)
    v2 = v1 + (<signed long long>5)
    tmp4 = method7(v0, v1, v2)
    v3, v4 = tmp4.v0, tmp4.v1
    del tmp4
    v5 = (<signed long long>5)
    tmp5 = method26(v0, v5)
    v6, v7 = tmp5.v0, tmp5.v1
    del tmp5
    v8 = v0[(<signed long long>10)]
    v9 = v8 == (<float>0)
    if v9:
        v11 = 1
    else:
        v11 = v8 == (<float>1)
    v12 = v11 == 0
    if v12:
        raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
    else:
        pass
    v13 = <signed long long>v8
    v14 = v7 + v13
    v15 = v14 == (<signed long long>1)
    if v15:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v16 = v14 == (<signed long long>0)
    if v16:
        v17 = (<signed long long>0)
    else:
        v17 = (<signed long long>1)
    v18 = v4 + v17
    v19 = v18 == (<signed long long>1)
    if v19:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v20 = v18 == (<signed long long>0)
    if v20:
        v21 = (<signed long long>0)
    else:
        v21 = (<signed long long>1)
    v22 = v21 == (<signed long long>1)
    v23 = v22 == 0
    if v23:
        raise Exception("Invalid format.")
    else:
        pass
    return Tuple0(v3, v6)
cdef void method24(signed long long v0, signed long long v1) except *:
    cdef numpy.ndarray[float,ndim=1] v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp6
    cdef bint v5
    cdef bint v7
    cdef bint v8
    v2 = method21(v0, v1)
    tmp6 = method25(v2)
    v3, v4 = tmp6.v0, tmp6.v1
    del tmp6
    del v2
    v5 = v0 == v3
    if v5:
        v7 = v1 == v4
    else:
        v7 = 0
    v8 = v7 == 0
    if v8:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef signed long long method30(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2, signed long long v3) except *:
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef float v12
    cdef signed long long v13
    v4 = v2 < (<signed long long>7)
    if v4:
        v5 = v2 + (<signed long long>1)
        v6 = (<signed long long>7) - v2
        v7 = v6 - (<signed long long>1)
        v8 = <signed long>v7
        v9 = (<signed long long>1) << v8
        v10 = v1 + v2
        v11 = v3 // v9
        v12 = <float>v11
        v0[v10] = v12
        v13 = v3 % v9
        return method30(v0, v1, v5, v13)
    else:
        return v3
cdef void method29(signed long long v0, numpy.ndarray[float,ndim=1] v1, signed long long v2) except *:
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef str v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    v3 = (<signed long long>0) <= v0
    if v3:
        v5 = v0 < (<signed long long>127)
    else:
        v5 = 0
    v6 = v5 == 0
    if v6:
        v7 = f'Pickle failure. Bin int value out of bounds. Got: {v0} Size: {(<signed long long>127)}'
        raise Exception(v7)
    else:
        pass
    v8 = v0 + (<signed long long>1)
    v9 = (<signed long long>0)
    v10 = method30(v1, v2, v9, v8)
cdef numpy.ndarray[float,ndim=1] method28(signed long long v0, signed long long v1, signed long long v2, signed long long v3, signed long long v4):
    cdef numpy.ndarray[float,ndim=1] v5
    cdef signed long long v6
    cdef bint v7
    cdef bint v9
    cdef bint v10
    cdef str v11
    cdef signed long long v12
    cdef bint v13
    cdef bint v15
    cdef bint v16
    cdef str v17
    cdef signed long long v18
    cdef bint v19
    cdef bint v21
    cdef bint v22
    cdef str v23
    cdef signed long long v24
    cdef bint v25
    cdef bint v27
    cdef bint v28
    cdef str v29
    cdef signed long long v30
    v5 = numpy.zeros((<signed long long>41),dtype=numpy.float32)
    v6 = (<signed long long>0)
    method29(v0, v5, v6)
    v7 = (<signed long long>0) <= v1
    if v7:
        v9 = v1 < (<signed long long>4)
    else:
        v9 = 0
    v10 = v9 == 0
    if v10:
        v11 = f'Pickling failure. Int value out of bounds. Got: {v1} Size: {(<signed long long>4)}'
        raise Exception(v11)
    else:
        pass
    v12 = (<signed long long>7) + v1
    v5[v12] = (<float>1)
    v13 = (<signed long long>0) <= v2
    if v13:
        v15 = v2 < (<signed long long>13)
    else:
        v15 = 0
    v16 = v15 == 0
    if v16:
        v17 = f'Pickling failure. Int value out of bounds. Got: {v2} Size: {(<signed long long>13)}'
        raise Exception(v17)
    else:
        pass
    v18 = (<signed long long>11) + v2
    v5[v18] = (<float>1)
    v19 = (<signed long long>0) <= v3
    if v19:
        v21 = v3 < (<signed long long>4)
    else:
        v21 = 0
    v22 = v21 == 0
    if v22:
        v23 = f'Pickling failure. Int value out of bounds. Got: {v3} Size: {(<signed long long>4)}'
        raise Exception(v23)
    else:
        pass
    v24 = (<signed long long>24) + v3
    v5[v24] = (<float>1)
    v25 = (<signed long long>0) <= v4
    if v25:
        v27 = v4 < (<signed long long>13)
    else:
        v27 = 0
    v28 = v27 == 0
    if v28:
        v29 = f'Pickling failure. Int value out of bounds. Got: {v4} Size: {(<signed long long>13)}'
        raise Exception(v29)
    else:
        pass
    v30 = (<signed long long>28) + v4
    v5[v30] = (<float>1)
    return v5
cdef signed long long method34(numpy.ndarray[float,ndim=1] v0, signed long long v1, signed long long v2, signed long long v3) except *:
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef float v7
    cdef bint v8
    cdef bint v10
    cdef bint v11
    cdef signed long long v12
    cdef signed long long v13
    cdef signed long long v14
    cdef signed long v15
    cdef signed long long v16
    cdef signed long long v17
    v4 = v2 < (<signed long long>7)
    if v4:
        v5 = v2 + (<signed long long>1)
        v6 = v1 + v2
        v7 = v0[v6]
        v8 = v7 == (<float>0)
        if v8:
            v10 = 1
        else:
            v10 = v7 == (<float>1)
        v11 = v10 == 0
        if v11:
            raise Exception("Unpickling failure. The bin int type must either be active or inactive.")
        else:
            pass
        v12 = <signed long long>v7
        v13 = (<signed long long>7) - v2
        v14 = v13 - (<signed long long>1)
        v15 = <signed long>v14
        v16 = v12 << v15
        v17 = v3 + v16
        return method34(v0, v1, v5, v17)
    else:
        return v3
cdef Tuple0 method33(numpy.ndarray[float,ndim=1] v0, signed long long v1):
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef signed long long v5
    cdef bint v6
    cdef signed long long v7
    v2 = (<signed long long>0)
    v3 = (<signed long long>0)
    v4 = method34(v0, v1, v2, v3)
    v5 = v4 - (<signed long long>1)
    v6 = (<signed long long>0) < v4
    if v6:
        v7 = (<signed long long>1)
    else:
        v7 = (<signed long long>0)
    return Tuple0(v5, v7)
cdef Tuple1 method32(numpy.ndarray[float,ndim=1] v0):
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef Tuple0 tmp7
    cdef signed long long v4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef Tuple0 tmp8
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef Tuple0 tmp9
    cdef signed long long v12
    cdef bint v13
    cdef bint v14
    cdef signed long long v15
    cdef signed long long v16
    cdef signed long long v17
    cdef signed long long v18
    cdef signed long long v19
    cdef Tuple0 tmp10
    cdef signed long long v20
    cdef signed long long v21
    cdef signed long long v22
    cdef signed long long v23
    cdef Tuple0 tmp11
    cdef signed long long v24
    cdef bint v25
    cdef bint v26
    cdef signed long long v27
    cdef signed long long v28
    cdef bint v29
    cdef bint v30
    cdef signed long long v31
    cdef signed long long v32
    cdef bint v33
    cdef bint v34
    cdef signed long long v35
    cdef bint v36
    cdef bint v37
    v1 = (<signed long long>0)
    tmp7 = method33(v0, v1)
    v2, v3 = tmp7.v0, tmp7.v1
    del tmp7
    v4 = (<signed long long>7)
    v5 = v4 + (<signed long long>4)
    tmp8 = method7(v0, v4, v5)
    v6, v7 = tmp8.v0, tmp8.v1
    del tmp8
    v8 = (<signed long long>11)
    v9 = v8 + (<signed long long>13)
    tmp9 = method7(v0, v8, v9)
    v10, v11 = tmp9.v0, tmp9.v1
    del tmp9
    v12 = v7 + v11
    v13 = v12 == (<signed long long>1)
    if v13:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v14 = v12 == (<signed long long>0)
    if v14:
        v15 = (<signed long long>0)
    else:
        v15 = (<signed long long>1)
    v16 = (<signed long long>24)
    v17 = v16 + (<signed long long>4)
    tmp10 = method7(v0, v16, v17)
    v18, v19 = tmp10.v0, tmp10.v1
    del tmp10
    v20 = (<signed long long>28)
    v21 = v20 + (<signed long long>13)
    tmp11 = method7(v0, v20, v21)
    v22, v23 = tmp11.v0, tmp11.v1
    del tmp11
    v24 = v19 + v23
    v25 = v24 == (<signed long long>1)
    if v25:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v26 = v24 == (<signed long long>0)
    if v26:
        v27 = (<signed long long>0)
    else:
        v27 = (<signed long long>1)
    v28 = v15 + v27
    v29 = v28 == (<signed long long>1)
    if v29:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v30 = v28 == (<signed long long>0)
    if v30:
        v31 = (<signed long long>0)
    else:
        v31 = (<signed long long>1)
    v32 = v3 + v31
    v33 = v32 == (<signed long long>1)
    if v33:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v34 = v32 == (<signed long long>0)
    if v34:
        v35 = (<signed long long>0)
    else:
        v35 = (<signed long long>1)
    v36 = v35 == (<signed long long>1)
    v37 = v36 == 0
    if v37:
        raise Exception("Invalid format.")
    else:
        pass
    return Tuple1(v2, v6, v10, v18, v22)
cdef void method31(signed long long v0, signed long long v1, signed long long v2, signed long long v3, signed long long v4) except *:
    cdef numpy.ndarray[float,ndim=1] v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef Tuple1 tmp12
    cdef bint v11
    cdef bint v19
    cdef bint v12
    cdef bint v14
    cdef bint v15
    cdef bint v20
    v5 = method28(v0, v1, v2, v3, v4)
    tmp12 = method32(v5)
    v6, v7, v8, v9, v10 = tmp12.v0, tmp12.v1, tmp12.v2, tmp12.v3, tmp12.v4
    del tmp12
    del v5
    v11 = v0 == v6
    if v11:
        v12 = v1 == v7
        if v12:
            v14 = v2 == v8
        else:
            v14 = 0
        if v14:
            v15 = v3 == v9
            if v15:
                v19 = v4 == v10
            else:
                v19 = 0
        else:
            v19 = 0
    else:
        v19 = 0
    v20 = v19 == 0
    if v20:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef bint method36(signed long long v0, Mut0 v1) except *:
    cdef signed long long v2
    v2 = v1.v0
    return v2 < v0
cdef numpy.ndarray[float,ndim=1] method35(signed long long v0, signed long long v1, signed long long v2, signed long long v3, signed long long v4, numpy.ndarray[object,ndim=1] v5):
    cdef numpy.ndarray[float,ndim=1] v6
    cdef signed long long v7
    cdef bint v8
    cdef bint v10
    cdef bint v11
    cdef str v12
    cdef signed long long v13
    cdef bint v14
    cdef bint v16
    cdef bint v17
    cdef str v18
    cdef signed long long v19
    cdef bint v20
    cdef bint v22
    cdef bint v23
    cdef str v24
    cdef signed long long v25
    cdef bint v26
    cdef bint v28
    cdef bint v29
    cdef str v30
    cdef signed long long v31
    cdef signed long long v32
    cdef bint v33
    cdef bint v34
    cdef bint v35
    cdef Mut0 v36
    cdef signed long long v38
    cdef signed long long v39
    cdef signed long long v40
    cdef Tuple0 tmp13
    cdef signed long long v41
    cdef signed long long v42
    cdef bint v43
    cdef bint v45
    cdef bint v46
    cdef str v47
    cdef signed long long v48
    cdef signed long long v49
    cdef bint v50
    cdef bint v52
    cdef bint v53
    cdef str v54
    cdef signed long long v55
    cdef signed long long v56
    v6 = numpy.zeros((<signed long long>127),dtype=numpy.float32)
    v7 = (<signed long long>0)
    method29(v0, v6, v7)
    v8 = (<signed long long>0) <= v1
    if v8:
        v10 = v1 < (<signed long long>4)
    else:
        v10 = 0
    v11 = v10 == 0
    if v11:
        v12 = f'Pickling failure. Int value out of bounds. Got: {v1} Size: {(<signed long long>4)}'
        raise Exception(v12)
    else:
        pass
    v13 = (<signed long long>7) + v1
    v6[v13] = (<float>1)
    v14 = (<signed long long>0) <= v2
    if v14:
        v16 = v2 < (<signed long long>13)
    else:
        v16 = 0
    v17 = v16 == 0
    if v17:
        v18 = f'Pickling failure. Int value out of bounds. Got: {v2} Size: {(<signed long long>13)}'
        raise Exception(v18)
    else:
        pass
    v19 = (<signed long long>11) + v2
    v6[v19] = (<float>1)
    v20 = (<signed long long>0) <= v3
    if v20:
        v22 = v3 < (<signed long long>4)
    else:
        v22 = 0
    v23 = v22 == 0
    if v23:
        v24 = f'Pickling failure. Int value out of bounds. Got: {v3} Size: {(<signed long long>4)}'
        raise Exception(v24)
    else:
        pass
    v25 = (<signed long long>24) + v3
    v6[v25] = (<float>1)
    v26 = (<signed long long>0) <= v4
    if v26:
        v28 = v4 < (<signed long long>13)
    else:
        v28 = 0
    v29 = v28 == 0
    if v29:
        v30 = f'Pickling failure. Int value out of bounds. Got: {v4} Size: {(<signed long long>13)}'
        raise Exception(v30)
    else:
        pass
    v31 = (<signed long long>28) + v4
    v6[v31] = (<float>1)
    v32 = len(v5)
    v33 = v32 <= (<signed long long>5)
    v34 = v33 == 0
    if v34:
        raise Exception("Pickling failure. The given array is too large.")
    else:
        pass
    v35 = v32 == (<signed long long>0)
    if v35:
        v6[(<signed long long>41)] = (<float>1)
    else:
        pass
    v36 = Mut0((<signed long long>0))
    while method36(v32, v36):
        v38 = v36.v0
        tmp13 = v5[v38]
        v39, v40 = tmp13.v0, tmp13.v1
        del tmp13
        v41 = v38 * (<signed long long>17)
        v42 = (<signed long long>42) + v41
        v43 = (<signed long long>0) <= v39
        if v43:
            v45 = v39 < (<signed long long>4)
        else:
            v45 = 0
        v46 = v45 == 0
        if v46:
            v47 = f'Pickling failure. Int value out of bounds. Got: {v39} Size: {(<signed long long>4)}'
            raise Exception(v47)
        else:
            pass
        v48 = v42 + v39
        v6[v48] = (<float>1)
        v49 = v42 + (<signed long long>4)
        v50 = (<signed long long>0) <= v40
        if v50:
            v52 = v40 < (<signed long long>13)
        else:
            v52 = 0
        v53 = v52 == 0
        if v53:
            v54 = f'Pickling failure. Int value out of bounds. Got: {v40} Size: {(<signed long long>13)}'
            raise Exception(v54)
        else:
            pass
        v55 = v49 + v40
        v6[v55] = (<float>1)
        v56 = v38 + (<signed long long>1)
        v36.v0 = v56
    del v36
    return v6
cdef signed long long method39(numpy.ndarray[float,ndim=1] v0, numpy.ndarray[object,ndim=1] v1, signed long long v2, signed long long v3, signed long long v4) except *:
    cdef bint v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef Tuple0 tmp19
    cdef signed long long v12
    cdef signed long long v13
    cdef signed long long v14
    cdef Tuple0 tmp20
    cdef signed long long v15
    cdef bint v16
    cdef bint v17
    cdef signed long long v18
    cdef bint v19
    cdef signed long long v24
    cdef bint v20
    cdef bint v22
    cdef bint v23
    v5 = v3 < (<signed long long>5)
    if v5:
        v6 = v3 + (<signed long long>1)
        v7 = v3 * (<signed long long>17)
        v8 = v2 + v7
        v9 = v8 + (<signed long long>4)
        tmp19 = method7(v0, v8, v9)
        v10, v11 = tmp19.v0, tmp19.v1
        del tmp19
        v12 = v9 + (<signed long long>13)
        tmp20 = method7(v0, v9, v12)
        v13, v14 = tmp20.v0, tmp20.v1
        del tmp20
        v15 = v11 + v14
        v16 = v15 == (<signed long long>1)
        if v16:
            raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
        else:
            pass
        v17 = v15 == (<signed long long>0)
        if v17:
            v18 = (<signed long long>0)
        else:
            v18 = (<signed long long>1)
        v19 = v3 == v4
        if v19:
            v20 = v18 == (<signed long long>1)
            if v20:
                v1[v3] = Tuple0(v10, v13)
            else:
                pass
            v24 = v4 + v18
        else:
            v22 = v18 == (<signed long long>0)
            v23 = v22 == 0
            if v23:
                raise Exception("Unpickling failure. Expected an inactive subsequence in the array unpickler.")
            else:
                pass
            v24 = v4
        return method39(v0, v1, v2, v6, v24)
    else:
        return v4
cdef Tuple2 method38(numpy.ndarray[float,ndim=1] v0):
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef Tuple0 tmp14
    cdef signed long long v4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef Tuple0 tmp15
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef Tuple0 tmp16
    cdef signed long long v12
    cdef bint v13
    cdef bint v14
    cdef signed long long v15
    cdef signed long long v16
    cdef signed long long v17
    cdef signed long long v18
    cdef signed long long v19
    cdef Tuple0 tmp17
    cdef signed long long v20
    cdef signed long long v21
    cdef signed long long v22
    cdef signed long long v23
    cdef Tuple0 tmp18
    cdef signed long long v24
    cdef bint v25
    cdef bint v26
    cdef signed long long v27
    cdef numpy.ndarray[object,ndim=1] v28
    cdef float v29
    cdef bint v30
    cdef bint v32
    cdef bint v33
    cdef signed long long v34
    cdef signed long long v35
    cdef signed long long v36
    cdef signed long long v37
    cdef signed long long v38
    cdef bint v39
    cdef bint v41
    cdef bint v42
    cdef bint v43
    cdef numpy.ndarray[object,ndim=1] v44
    cdef bint v45
    cdef signed long long v46
    cdef signed long long v47
    cdef signed long long v48
    cdef bint v49
    cdef bint v50
    cdef signed long long v51
    cdef signed long long v52
    cdef bint v53
    cdef bint v54
    cdef signed long long v55
    cdef signed long long v56
    cdef bint v57
    cdef bint v58
    cdef signed long long v59
    cdef bint v60
    cdef bint v61
    v1 = (<signed long long>0)
    tmp14 = method33(v0, v1)
    v2, v3 = tmp14.v0, tmp14.v1
    del tmp14
    v4 = (<signed long long>7)
    v5 = v4 + (<signed long long>4)
    tmp15 = method7(v0, v4, v5)
    v6, v7 = tmp15.v0, tmp15.v1
    del tmp15
    v8 = (<signed long long>11)
    v9 = v8 + (<signed long long>13)
    tmp16 = method7(v0, v8, v9)
    v10, v11 = tmp16.v0, tmp16.v1
    del tmp16
    v12 = v7 + v11
    v13 = v12 == (<signed long long>1)
    if v13:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v14 = v12 == (<signed long long>0)
    if v14:
        v15 = (<signed long long>0)
    else:
        v15 = (<signed long long>1)
    v16 = (<signed long long>24)
    v17 = v16 + (<signed long long>4)
    tmp17 = method7(v0, v16, v17)
    v18, v19 = tmp17.v0, tmp17.v1
    del tmp17
    v20 = (<signed long long>28)
    v21 = v20 + (<signed long long>13)
    tmp18 = method7(v0, v20, v21)
    v22, v23 = tmp18.v0, tmp18.v1
    del tmp18
    v24 = v19 + v23
    v25 = v24 == (<signed long long>1)
    if v25:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v26 = v24 == (<signed long long>0)
    if v26:
        v27 = (<signed long long>0)
    else:
        v27 = (<signed long long>1)
    v28 = numpy.empty((<signed long long>5),dtype=object)
    v29 = v0[(<signed long long>41)]
    v30 = v29 == (<float>0)
    if v30:
        v32 = 1
    else:
        v32 = v29 == (<float>1)
    v33 = v32 == 0
    if v33:
        raise Exception("Unpickling failure. The array emptiness flag should be 1 or 0.")
    else:
        pass
    v34 = <signed long long>v29
    v35 = (<signed long long>42)
    v36 = (<signed long long>0)
    v37 = (<signed long long>0)
    v38 = method39(v0, v28, v35, v36, v37)
    v39 = v34 == (<signed long long>1)
    if v39:
        v41 = (<signed long long>0) < v38
    else:
        v41 = 0
    v42 = v41 == 0
    v43 = v42 == 0
    if v43:
        raise Exception("Unpickling failure. Empty arrays should not have active elements.")
    else:
        pass
    v44 = v28[:v38]
    del v28
    v45 = (<signed long long>1) < v38
    if v45:
        v46 = (<signed long long>1)
    else:
        v46 = v38
    v47 = v34 | v46
    v48 = v27 + v47
    v49 = v48 == (<signed long long>1)
    if v49:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v50 = v48 == (<signed long long>0)
    if v50:
        v51 = (<signed long long>0)
    else:
        v51 = (<signed long long>1)
    v52 = v15 + v51
    v53 = v52 == (<signed long long>1)
    if v53:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v54 = v52 == (<signed long long>0)
    if v54:
        v55 = (<signed long long>0)
    else:
        v55 = (<signed long long>1)
    v56 = v3 + v55
    v57 = v56 == (<signed long long>1)
    if v57:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v58 = v56 == (<signed long long>0)
    if v58:
        v59 = (<signed long long>0)
    else:
        v59 = (<signed long long>1)
    v60 = v59 == (<signed long long>1)
    v61 = v60 == 0
    if v61:
        raise Exception("Invalid format.")
    else:
        pass
    return Tuple2(v2, v6, v10, v18, v22, v44)
cdef bint method40(numpy.ndarray[object,ndim=1] v0, numpy.ndarray[object,ndim=1] v1, signed long long v2) except *:
    cdef signed long long v3
    cdef bint v4
    cdef signed long long v5
    cdef signed long long v6
    cdef Tuple0 tmp22
    cdef signed long long v7
    cdef signed long long v8
    cdef Tuple0 tmp23
    cdef bint v9
    cdef bint v11
    cdef signed long long v12
    v3 = len(v0)
    v4 = v2 < v3
    if v4:
        tmp22 = v0[v2]
        v5, v6 = tmp22.v0, tmp22.v1
        del tmp22
        tmp23 = v1[v2]
        v7, v8 = tmp23.v0, tmp23.v1
        del tmp23
        v9 = v5 == v7
        if v9:
            v11 = v6 == v8
        else:
            v11 = 0
        if v11:
            v12 = v2 + (<signed long long>1)
            return method40(v0, v1, v12)
        else:
            return 0
    else:
        return 1
cdef void method37(signed long long v0, signed long long v1, signed long long v2, signed long long v3, signed long long v4, numpy.ndarray[object,ndim=1] v5) except *:
    cdef numpy.ndarray[float,ndim=1] v6
    cdef signed long long v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef numpy.ndarray[object,ndim=1] v12
    cdef Tuple2 tmp21
    cdef bint v13
    cdef bint v29
    cdef bint v14
    cdef bint v16
    cdef bint v17
    cdef bint v19
    cdef signed long long v20
    cdef signed long long v21
    cdef bint v22
    cdef bint v23
    cdef signed long long v24
    cdef bint v30
    v6 = method35(v0, v1, v2, v3, v4, v5)
    tmp21 = method38(v6)
    v7, v8, v9, v10, v11, v12 = tmp21.v0, tmp21.v1, tmp21.v2, tmp21.v3, tmp21.v4, tmp21.v5
    del tmp21
    del v6
    v13 = v0 == v7
    if v13:
        v14 = v1 == v8
        if v14:
            v16 = v2 == v9
        else:
            v16 = 0
        if v16:
            v17 = v3 == v10
            if v17:
                v19 = v4 == v11
            else:
                v19 = 0
            if v19:
                v20 = len(v5)
                v21 = len(v12)
                v22 = v20 == v21
                v23 = v22 != 1
                if v23:
                    v29 = 0
                else:
                    v24 = (<signed long long>0)
                    v29 = method40(v5, v12, v24)
            else:
                v29 = 0
        else:
            v29 = 0
    else:
        v29 = 0
    del v12
    v30 = v29 == 0
    if v30:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef numpy.ndarray[float,ndim=1] method41(numpy.ndarray[object,ndim=1] v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    cdef bint v3
    cdef bint v4
    cdef bint v5
    cdef Mut0 v6
    cdef signed long long v8
    cdef signed long long v9
    cdef numpy.ndarray[signed long,ndim=1] v10
    cdef Tuple3 tmp24
    cdef signed long long v11
    cdef signed long long v12
    cdef bint v13
    cdef bint v15
    cdef bint v16
    cdef str v17
    cdef signed long long v18
    cdef signed long long v19
    cdef signed long long v20
    cdef bint v21
    cdef bint v22
    cdef bint v23
    cdef signed long long v24
    cdef Mut0 v25
    cdef signed long long v27
    cdef US0 v28
    cdef signed long long v29
    cdef signed long long v30
    cdef signed long long v31
    cdef signed long long v32
    cdef signed long long v33
    cdef signed long long v34
    v1 = numpy.zeros((<signed long long>33),dtype=numpy.float32)
    v2 = len(v0)
    v3 = v2 <= (<signed long long>2)
    v4 = v3 == 0
    if v4:
        raise Exception("Pickling failure. The given array is too large.")
    else:
        pass
    v5 = v2 == (<signed long long>0)
    if v5:
        v1[(<signed long long>0)] = (<float>1)
    else:
        pass
    v6 = Mut0((<signed long long>0))
    while method36(v2, v6):
        v8 = v6.v0
        tmp24 = v0[v8]
        v9, v10 = tmp24.v0, tmp24.v1
        del tmp24
        v11 = v8 * (<signed long long>16)
        v12 = (<signed long long>1) + v11
        v13 = (<signed long long>0) <= v9
        if v13:
            v15 = v9 < (<signed long long>3)
        else:
            v15 = 0
        v16 = v15 == 0
        if v16:
            v17 = f'Pickling failure. Int value out of bounds. Got: {v9} Size: {(<signed long long>3)}'
            raise Exception(v17)
        else:
            pass
        v18 = v12 + v9
        v1[v18] = (<float>1)
        v19 = v12 + (<signed long long>3)
        v20 = len(v10)
        v21 = v20 <= (<signed long long>4)
        v22 = v21 == 0
        if v22:
            raise Exception("Pickling failure. The given array is too large.")
        else:
            pass
        v23 = v20 == (<signed long long>0)
        if v23:
            v1[v19] = (<float>1)
        else:
            pass
        v24 = v19 + (<signed long long>1)
        v25 = Mut0((<signed long long>0))
        while method36(v20, v25):
            v27 = v25.v0
            v28 = v10[v27]
            v29 = v27 * (<signed long long>3)
            v30 = v24 + v29
            if v28 == 0: # Call
                v1[v30] = (<float>1)
            elif v28 == 1: # Fold
                v31 = v30 + (<signed long long>1)
                v1[v31] = (<float>1)
            elif v28 == 2: # Raise
                v32 = v30 + (<signed long long>2)
                v1[v32] = (<float>1)
            v33 = v27 + (<signed long long>1)
            v25.v0 = v33
        del v10
        del v25
        v34 = v8 + (<signed long long>1)
        v6.v0 = v34
    del v6
    return v1
cdef signed long long method45(numpy.ndarray[float,ndim=1] v0, numpy.ndarray[signed long,ndim=1] v1, signed long long v2, signed long long v3, signed long long v4) except *:
    cdef bint v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long long v8
    cdef float v9
    cdef bint v10
    cdef bint v12
    cdef bint v13
    cdef signed long long v14
    cdef signed long long v15
    cdef float v16
    cdef bint v17
    cdef bint v19
    cdef bint v20
    cdef signed long long v21
    cdef signed long long v22
    cdef float v23
    cdef bint v24
    cdef bint v26
    cdef bint v27
    cdef signed long long v28
    cdef bint v29
    cdef US0 v32
    cdef signed long long v33
    cdef bint v34
    cdef US0 v36
    cdef signed long long v37
    cdef bint v38
    cdef bint v39
    cdef bint v40
    cdef signed long long v45
    cdef bint v41
    cdef bint v43
    cdef bint v44
    v5 = v3 < (<signed long long>4)
    if v5:
        v6 = v3 + (<signed long long>1)
        v7 = v3 * (<signed long long>3)
        v8 = v2 + v7
        v9 = v0[v8]
        v10 = v9 == (<float>0)
        if v10:
            v12 = 1
        else:
            v12 = v9 == (<float>1)
        v13 = v12 == 0
        if v13:
            raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
        else:
            pass
        v14 = <signed long long>v9
        v15 = v8 + (<signed long long>1)
        v16 = v0[v15]
        v17 = v16 == (<float>0)
        if v17:
            v19 = 1
        else:
            v19 = v16 == (<float>1)
        v20 = v19 == 0
        if v20:
            raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
        else:
            pass
        v21 = <signed long long>v16
        v22 = v8 + (<signed long long>2)
        v23 = v0[v22]
        v24 = v23 == (<float>0)
        if v24:
            v26 = 1
        else:
            v26 = v23 == (<float>1)
        v27 = v26 == 0
        if v27:
            raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
        else:
            pass
        v28 = <signed long long>v23
        v29 = v21 == (<signed long long>1)
        if v29:
            v32 = 1
        else:
            v32 = 0
        v33 = v14 + v21
        v34 = v28 == (<signed long long>1)
        if v34:
            v36 = 2
        else:
            v36 = v32
        v37 = v33 + v28
        v38 = v37 <= (<signed long long>1)
        v39 = v38 == 0
        if v39:
            raise Exception("Unpickling failure. Only a single case of an union type should be active at most.")
        else:
            pass
        v40 = v3 == v4
        if v40:
            v41 = v37 == (<signed long long>1)
            if v41:
                v1[v3] = v36
            else:
                pass
            v45 = v4 + v37
        else:
            v43 = v37 == (<signed long long>0)
            v44 = v43 == 0
            if v44:
                raise Exception("Unpickling failure. Expected an inactive subsequence in the array unpickler.")
            else:
                pass
            v45 = v4
        return method45(v0, v1, v2, v6, v45)
    else:
        return v4
cdef signed long long method44(numpy.ndarray[float,ndim=1] v0, numpy.ndarray[object,ndim=1] v1, signed long long v2, signed long long v3, signed long long v4) except *:
    cdef bint v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef Tuple0 tmp25
    cdef numpy.ndarray[signed long,ndim=1] v12
    cdef float v13
    cdef bint v14
    cdef bint v16
    cdef bint v17
    cdef signed long long v18
    cdef signed long long v19
    cdef signed long long v20
    cdef signed long long v21
    cdef signed long long v22
    cdef bint v23
    cdef bint v25
    cdef bint v26
    cdef bint v27
    cdef numpy.ndarray[signed long,ndim=1] v28
    cdef bint v29
    cdef signed long long v30
    cdef signed long long v31
    cdef signed long long v32
    cdef bint v33
    cdef bint v34
    cdef signed long long v35
    cdef bint v36
    cdef signed long long v41
    cdef bint v37
    cdef bint v39
    cdef bint v40
    v5 = v3 < (<signed long long>2)
    if v5:
        v6 = v3 + (<signed long long>1)
        v7 = v3 * (<signed long long>16)
        v8 = v2 + v7
        v9 = v8 + (<signed long long>3)
        tmp25 = method7(v0, v8, v9)
        v10, v11 = tmp25.v0, tmp25.v1
        del tmp25
        v12 = numpy.empty((<signed long long>4),dtype=numpy.int32)
        v13 = v0[v9]
        v14 = v13 == (<float>0)
        if v14:
            v16 = 1
        else:
            v16 = v13 == (<float>1)
        v17 = v16 == 0
        if v17:
            raise Exception("Unpickling failure. The array emptiness flag should be 1 or 0.")
        else:
            pass
        v18 = <signed long long>v13
        v19 = v9 + (<signed long long>1)
        v20 = (<signed long long>0)
        v21 = (<signed long long>0)
        v22 = method45(v0, v12, v19, v20, v21)
        v23 = v18 == (<signed long long>1)
        if v23:
            v25 = (<signed long long>0) < v22
        else:
            v25 = 0
        v26 = v25 == 0
        v27 = v26 == 0
        if v27:
            raise Exception("Unpickling failure. Empty arrays should not have active elements.")
        else:
            pass
        v28 = v12[:v22]
        del v12
        v29 = (<signed long long>1) < v22
        if v29:
            v30 = (<signed long long>1)
        else:
            v30 = v22
        v31 = v18 | v30
        v32 = v11 + v31
        v33 = v32 == (<signed long long>1)
        if v33:
            raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
        else:
            pass
        v34 = v32 == (<signed long long>0)
        if v34:
            v35 = (<signed long long>0)
        else:
            v35 = (<signed long long>1)
        v36 = v3 == v4
        if v36:
            v37 = v35 == (<signed long long>1)
            if v37:
                v1[v3] = Tuple3(v10, v28)
            else:
                pass
            v41 = v4 + v35
        else:
            v39 = v35 == (<signed long long>0)
            v40 = v39 == 0
            if v40:
                raise Exception("Unpickling failure. Expected an inactive subsequence in the array unpickler.")
            else:
                pass
            v41 = v4
        del v28
        return method44(v0, v1, v2, v6, v41)
    else:
        return v4
cdef numpy.ndarray[object,ndim=1] method43(numpy.ndarray[float,ndim=1] v0):
    cdef numpy.ndarray[object,ndim=1] v1
    cdef float v2
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef signed long long v7
    cdef signed long long v8
    cdef signed long long v9
    cdef signed long long v10
    cdef signed long long v11
    cdef bint v12
    cdef bint v14
    cdef bint v15
    cdef bint v16
    cdef numpy.ndarray[object,ndim=1] v17
    cdef bint v18
    cdef signed long long v19
    cdef signed long long v20
    cdef bint v21
    cdef bint v22
    v1 = numpy.empty((<signed long long>2),dtype=object)
    v2 = v0[(<signed long long>0)]
    v3 = v2 == (<float>0)
    if v3:
        v5 = 1
    else:
        v5 = v2 == (<float>1)
    v6 = v5 == 0
    if v6:
        raise Exception("Unpickling failure. The array emptiness flag should be 1 or 0.")
    else:
        pass
    v7 = <signed long long>v2
    v8 = (<signed long long>1)
    v9 = (<signed long long>0)
    v10 = (<signed long long>0)
    v11 = method44(v0, v1, v8, v9, v10)
    v12 = v7 == (<signed long long>1)
    if v12:
        v14 = (<signed long long>0) < v11
    else:
        v14 = 0
    v15 = v14 == 0
    v16 = v15 == 0
    if v16:
        raise Exception("Unpickling failure. Empty arrays should not have active elements.")
    else:
        pass
    v17 = v1[:v11]
    del v1
    v18 = (<signed long long>1) < v11
    if v18:
        v19 = (<signed long long>1)
    else:
        v19 = v11
    v20 = v7 | v19
    v21 = v20 == (<signed long long>1)
    v22 = v21 == 0
    if v22:
        raise Exception("Invalid format.")
    else:
        pass
    return v17
cdef bint method47(numpy.ndarray[signed long,ndim=1] v0, numpy.ndarray[signed long,ndim=1] v1, signed long long v2) except *:
    cdef signed long long v3
    cdef bint v4
    cdef US0 v5
    cdef US0 v6
    cdef bint v7
    cdef signed long long v8
    v3 = len(v0)
    v4 = v2 < v3
    if v4:
        v5 = v0[v2]
        v6 = v1[v2]
        if v5 == 0 and v6 == 0: # Call
            v7 = 1
        elif v5 == 1 and v6 == 1: # Fold
            v7 = 1
        elif v5 == 2 and v6 == 2: # Raise
            v7 = 1
        else:
            v7 = 0
        if v7:
            v8 = v2 + (<signed long long>1)
            return method47(v0, v1, v8)
        else:
            return 0
    else:
        return 1
cdef bint method46(numpy.ndarray[object,ndim=1] v0, numpy.ndarray[object,ndim=1] v1, signed long long v2) except *:
    cdef signed long long v3
    cdef bint v4
    cdef signed long long v5
    cdef numpy.ndarray[signed long,ndim=1] v6
    cdef Tuple3 tmp26
    cdef signed long long v7
    cdef numpy.ndarray[signed long,ndim=1] v8
    cdef Tuple3 tmp27
    cdef bint v9
    cdef bint v17
    cdef signed long long v10
    cdef signed long long v11
    cdef bint v12
    cdef bint v13
    cdef signed long long v14
    cdef signed long long v18
    v3 = len(v0)
    v4 = v2 < v3
    if v4:
        tmp26 = v0[v2]
        v5, v6 = tmp26.v0, tmp26.v1
        del tmp26
        tmp27 = v1[v2]
        v7, v8 = tmp27.v0, tmp27.v1
        del tmp27
        v9 = v5 == v7
        if v9:
            v10 = len(v6)
            v11 = len(v8)
            v12 = v10 == v11
            v13 = v12 != 1
            if v13:
                v17 = 0
            else:
                v14 = (<signed long long>0)
                v17 = method47(v6, v8, v14)
        else:
            v17 = 0
        del v6; del v8
        if v17:
            v18 = v2 + (<signed long long>1)
            return method46(v0, v1, v18)
        else:
            return 0
    else:
        return 1
cdef void method42(numpy.ndarray[object,ndim=1] v0) except *:
    cdef numpy.ndarray[float,ndim=1] v1
    cdef numpy.ndarray[object,ndim=1] v2
    cdef signed long long v3
    cdef signed long long v4
    cdef bint v5
    cdef bint v6
    cdef bint v9
    cdef signed long long v7
    cdef bint v10
    v1 = method41(v0)
    v2 = method43(v1)
    del v1
    v3 = len(v0)
    v4 = len(v2)
    v5 = v3 == v4
    v6 = v5 != 1
    if v6:
        v9 = 0
    else:
        v7 = (<signed long long>0)
        v9 = method46(v0, v2, v7)
    del v2
    v10 = v9 == 0
    if v10:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef numpy.ndarray[float,ndim=1] method48(US1 v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef US0 v2
    cdef signed long long v3
    cdef bint v4
    cdef bint v6
    cdef bint v7
    cdef str v8
    cdef signed long long v9
    v1 = numpy.zeros((<signed long long>6),dtype=numpy.float32)
    if v0.tag == 0: # Action
        v2 = (<US1_0>v0).v0
        if v2 == 0: # Call
            v1[(<signed long long>0)] = (<float>1)
        elif v2 == 1: # Fold
            v1[(<signed long long>1)] = (<float>1)
        elif v2 == 2: # Raise
            v1[(<signed long long>2)] = (<float>1)
    elif v0.tag == 1: # Card
        v3 = (<US1_1>v0).v0
        v4 = (<signed long long>0) <= v3
        if v4:
            v6 = v3 < (<signed long long>3)
        else:
            v6 = 0
        v7 = v6 == 0
        if v7:
            v8 = f'Pickling failure. Int value out of bounds. Got: {v3} Size: {(<signed long long>3)}'
            raise Exception(v8)
        else:
            pass
        v9 = (<signed long long>3) + v3
        v1[v9] = (<float>1)
    return v1
cdef US1 method50(numpy.ndarray[float,ndim=1] v0):
    cdef float v1
    cdef bint v2
    cdef bint v4
    cdef bint v5
    cdef signed long long v6
    cdef float v7
    cdef bint v8
    cdef bint v10
    cdef bint v11
    cdef signed long long v12
    cdef float v13
    cdef bint v14
    cdef bint v16
    cdef bint v17
    cdef signed long long v18
    cdef bint v19
    cdef US0 v22
    cdef signed long long v23
    cdef bint v24
    cdef US0 v26
    cdef signed long long v27
    cdef bint v28
    cdef bint v29
    cdef signed long long v30
    cdef signed long long v31
    cdef signed long long v32
    cdef signed long long v33
    cdef Tuple0 tmp28
    cdef bint v34
    cdef US1 v37
    cdef signed long long v38
    cdef bint v39
    cdef bint v40
    cdef bint v41
    cdef bint v42
    v1 = v0[(<signed long long>0)]
    v2 = v1 == (<float>0)
    if v2:
        v4 = 1
    else:
        v4 = v1 == (<float>1)
    v5 = v4 == 0
    if v5:
        raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
    else:
        pass
    v6 = <signed long long>v1
    v7 = v0[(<signed long long>1)]
    v8 = v7 == (<float>0)
    if v8:
        v10 = 1
    else:
        v10 = v7 == (<float>1)
    v11 = v10 == 0
    if v11:
        raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
    else:
        pass
    v12 = <signed long long>v7
    v13 = v0[(<signed long long>2)]
    v14 = v13 == (<float>0)
    if v14:
        v16 = 1
    else:
        v16 = v13 == (<float>1)
    v17 = v16 == 0
    if v17:
        raise Exception("Unpickling failure. The unit type should always be either be active or inactive.")
    else:
        pass
    v18 = <signed long long>v13
    v19 = v12 == (<signed long long>1)
    if v19:
        v22 = 1
    else:
        v22 = 0
    v23 = v6 + v12
    v24 = v18 == (<signed long long>1)
    if v24:
        v26 = 2
    else:
        v26 = v22
    v27 = v23 + v18
    v28 = v27 <= (<signed long long>1)
    v29 = v28 == 0
    if v29:
        raise Exception("Unpickling failure. Only a single case of an union type should be active at most.")
    else:
        pass
    v30 = (<signed long long>3)
    v31 = v30 + (<signed long long>3)
    tmp28 = method7(v0, v30, v31)
    v32, v33 = tmp28.v0, tmp28.v1
    del tmp28
    v34 = v33 == (<signed long long>1)
    if v34:
        v37 = US1_1(v32)
    else:
        v37 = US1_0(v26)
    v38 = v27 + v33
    v39 = v38 <= (<signed long long>1)
    v40 = v39 == 0
    if v40:
        raise Exception("Unpickling failure. Only a single case of an union type should be active at most.")
    else:
        pass
    v41 = v38 == (<signed long long>1)
    v42 = v41 == 0
    if v42:
        raise Exception("Invalid format.")
    else:
        pass
    return v37
cdef void method49(US1 v0) except *:
    cdef numpy.ndarray[float,ndim=1] v1
    cdef US1 v2
    cdef bint v9
    cdef US0 v3
    cdef US0 v4
    cdef signed long long v6
    cdef signed long long v7
    cdef bint v10
    v1 = method48(v0)
    v2 = method50(v1)
    del v1
    if v0.tag == 0 and v2.tag == 0: # Action
        v3 = (<US1_0>v0).v0; v4 = (<US1_0>v2).v0
        if v3 == 0 and v4 == 0: # Call
            v9 = 1
        elif v3 == 1 and v4 == 1: # Fold
            v9 = 1
        elif v3 == 2 and v4 == 2: # Raise
            v9 = 1
        else:
            v9 = 0
    elif v0.tag == 1 and v2.tag == 1: # Card
        v6 = (<US1_1>v0).v0; v7 = (<US1_1>v2).v0
        v9 = v6 == v7
    else:
        v9 = 0
    del v2
    v10 = v9 == 0
    if v10:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef numpy.ndarray[float,ndim=1] method51(signed long long v0):
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef str v7
    v1 = numpy.zeros((<signed long long>9),dtype=numpy.float32)
    v2 = (<signed long long>-2) + v0
    v3 = (<signed long long>0) <= v2
    if v3:
        v5 = v2 < (<signed long long>9)
    else:
        v5 = 0
    v6 = v5 == 0
    if v6:
        v7 = f'Pickling failure. Int value out of bounds. Got: {v2} Size: {(<signed long long>9)}'
        raise Exception(v7)
    else:
        pass
    v1[v2] = (<float>1)
    return v1
cdef signed long long method53(numpy.ndarray[float,ndim=1] v0) except *:
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp29
    cdef signed long long v5
    cdef bint v6
    cdef bint v7
    v1 = (<signed long long>0)
    v2 = v1 + (<signed long long>9)
    tmp29 = method7(v0, v1, v2)
    v3, v4 = tmp29.v0, tmp29.v1
    del tmp29
    v5 = (<signed long long>2) + v3
    v6 = v4 == (<signed long long>1)
    v7 = v6 == 0
    if v7:
        raise Exception("Invalid format.")
    else:
        pass
    return v5
cdef void method52(signed long long v0) except *:
    cdef numpy.ndarray[float,ndim=1] v1
    cdef signed long long v2
    cdef bint v3
    cdef bint v4
    v1 = method51(v0)
    v2 = method53(v1)
    del v1
    v3 = v0 == v2
    v4 = v3 == 0
    if v4:
        raise Exception("PU round trip failed.")
    else:
        pass
cdef numpy.ndarray[float,ndim=1] method54(signed long long v0, signed long long v1):
    cdef numpy.ndarray[float,ndim=1] v2
    cdef bint v3
    cdef bint v5
    cdef bint v6
    cdef str v7
    cdef bint v8
    cdef bint v10
    cdef bint v11
    cdef str v12
    cdef signed long long v13
    v2 = numpy.zeros((<signed long long>10),dtype=numpy.float32)
    v3 = (<signed long long>0) <= v0
    if v3:
        v5 = v0 < (<signed long long>5)
    else:
        v5 = 0
    v6 = v5 == 0
    if v6:
        v7 = f'Pickling failure. Int value out of bounds. Got: {v0} Size: {(<signed long long>5)}'
        raise Exception(v7)
    else:
        pass
    v2[v0] = (<float>1)
    v8 = (<signed long long>0) <= v1
    if v8:
        v10 = v1 < (<signed long long>5)
    else:
        v10 = 0
    v11 = v10 == 0
    if v11:
        v12 = f'Pickling failure. Int value out of bounds. Got: {v1} Size: {(<signed long long>5)}'
        raise Exception(v12)
    else:
        pass
    v13 = (<signed long long>5) + v1
    v2[v13] = (<float>1)
    return v2
cdef Tuple0 method56(numpy.ndarray[float,ndim=1] v0):
    cdef signed long long v1
    cdef signed long long v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp30
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef signed long long v8
    cdef Tuple0 tmp31
    cdef signed long long v9
    cdef bint v10
    cdef bint v11
    cdef signed long long v12
    cdef bint v13
    cdef bint v14
    v1 = (<signed long long>0)
    v2 = v1 + (<signed long long>5)
    tmp30 = method7(v0, v1, v2)
    v3, v4 = tmp30.v0, tmp30.v1
    del tmp30
    v5 = (<signed long long>5)
    v6 = v5 + (<signed long long>5)
    tmp31 = method7(v0, v5, v6)
    v7, v8 = tmp31.v0, tmp31.v1
    del tmp31
    v9 = v4 + v8
    v10 = v9 == (<signed long long>1)
    if v10:
        raise Exception("Unpickling failure. Two sides of a pair should either all be active or inactive.")
    else:
        pass
    v11 = v9 == (<signed long long>0)
    if v11:
        v12 = (<signed long long>0)
    else:
        v12 = (<signed long long>1)
    v13 = v12 == (<signed long long>1)
    v14 = v13 == 0
    if v14:
        raise Exception("Invalid format.")
    else:
        pass
    return Tuple0(v3, v7)
cdef void method55(signed long long v0, signed long long v1) except *:
    cdef numpy.ndarray[float,ndim=1] v2
    cdef signed long long v3
    cdef signed long long v4
    cdef Tuple0 tmp32
    cdef bint v5
    cdef bint v7
    cdef bint v8
    v2 = method54(v0, v1)
    tmp32 = method56(v2)
    v3, v4 = tmp32.v0, tmp32.v1
    del tmp32
    del v2
    v5 = v0 == v3
    if v5:
        v7 = v1 == v4
    else:
        v7 = 0
    v8 = v7 == 0
    if v8:
        raise Exception("PU round trip failed.")
    else:
        pass
cpdef void main() except *:
    cdef numpy.ndarray[float,ndim=1] v0
    cdef signed long long v1
    cdef numpy.ndarray[float,ndim=1] v2
    cdef signed long long v3
    cdef numpy.ndarray[float,ndim=1] v4
    cdef signed long long v5
    cdef signed long long v6
    cdef signed long long v7
    cdef numpy.ndarray[float,ndim=1] v8
    cdef signed long long v9
    cdef numpy.ndarray[float,ndim=1] v10
    cdef signed long long v11
    cdef numpy.ndarray[float,ndim=1] v12
    cdef signed long long v13
    cdef numpy.ndarray[float,ndim=1] v14
    cdef signed long long v15
    cdef numpy.ndarray[float,ndim=1] v16
    cdef UH0 v17
    cdef UH0 v18
    cdef UH0 v19
    cdef UH0 v20
    cdef UH0 v21
    cdef UH0 v22
    cdef numpy.ndarray[object,ndim=1] v23
    cdef signed long long v24
    cdef signed long long v25
    cdef signed long long v26
    cdef signed long long v27
    cdef signed long long v28
    cdef signed long long v29
    cdef signed long long v30
    cdef numpy.ndarray[float,ndim=1] v31
    cdef signed long long v32
    cdef signed long long v33
    cdef signed long long v34
    cdef signed long long v35
    cdef signed long long v36
    cdef signed long long v37
    cdef signed long long v38
    cdef numpy.ndarray[float,ndim=1] v39
    cdef signed long long v40
    cdef signed long long v41
    cdef signed long long v42
    cdef signed long long v43
    cdef signed long long v44
    cdef numpy.ndarray[object,ndim=1] v45
    cdef signed long long v46
    cdef signed long long v47
    cdef signed long long v48
    cdef signed long long v49
    cdef signed long long v50
    cdef numpy.ndarray[float,ndim=1] v51
    cdef numpy.ndarray[object,ndim=1] v52
    cdef signed long long v53
    cdef signed long long v54
    cdef signed long long v55
    cdef signed long long v56
    cdef signed long long v57
    cdef US0 v58
    cdef US0 v59
    cdef US0 v60
    cdef US0 v61
    cdef numpy.ndarray[signed long,ndim=1] v62
    cdef US0 v63
    cdef numpy.ndarray[signed long,ndim=1] v64
    cdef numpy.ndarray[object,ndim=1] v65
    cdef numpy.ndarray[float,ndim=1] v66
    cdef US0 v67
    cdef US1 v68
    cdef numpy.ndarray[float,ndim=1] v69
    cdef signed long long v70
    cdef US1 v71
    cdef numpy.ndarray[float,ndim=1] v72
    cdef US0 v73
    cdef US1 v74
    cdef numpy.ndarray[float,ndim=1] v75
    cdef US0 v76
    cdef US1 v77
    cdef numpy.ndarray[float,ndim=1] v78
    cdef US0 v79
    cdef US1 v80
    cdef numpy.ndarray[float,ndim=1] v81
    cdef US0 v82
    cdef US1 v83
    cdef numpy.ndarray[float,ndim=1] v84
    cdef signed long long v85
    cdef US1 v86
    cdef numpy.ndarray[float,ndim=1] v87
    cdef UH0 v88
    cdef UH0 v89
    cdef UH0 v90
    cdef UH0 v91
    cdef UH0 v92
    cdef UH0 v93
    cdef UH0 v94
    cdef UH0 v95
    cdef numpy.ndarray[object,ndim=1] v96
    cdef signed long long v97
    cdef US1 v98
    cdef US0 v99
    cdef US1 v100
    cdef US0 v101
    cdef US1 v102
    cdef US0 v103
    cdef US1 v104
    cdef US0 v105
    cdef US1 v106
    cdef signed long long v107
    cdef US1 v108
    cdef US0 v109
    cdef US1 v110
    cdef signed long long v111
    cdef numpy.ndarray[float,ndim=1] v112
    cdef signed long long v113
    cdef numpy.ndarray[float,ndim=1] v114
    cdef signed long long v115
    cdef numpy.ndarray[float,ndim=1] v116
    cdef UH0 v117
    cdef UH0 v118
    cdef UH0 v119
    cdef UH0 v120
    cdef numpy.ndarray[object,ndim=1] v121
    cdef signed long long v122
    cdef signed long long v123
    cdef signed long long v124
    cdef signed long long v125
    cdef signed long long v126
    cdef numpy.ndarray[float,ndim=1] v127
    cdef signed long long v128
    cdef signed long long v129
    v0 = method0()
    print(v0)
    del v0
    method1()
    v1 = (<signed long long>1)
    v2 = method3(v1)
    print(v2)
    del v2
    v3 = (<signed long long>5)
    v4 = method4(v3)
    print(v4)
    del v4
    v5 = (<signed long long>1)
    method5(v5)
    v6 = (<signed long long>5)
    method9(v6)
    v7 = (<signed long long>654)
    v8 = method11(v7)
    v9 = (<signed long long>123)
    v10 = method11(v9)
    v11 = (<signed long long>5)
    v12 = method11(v11)
    v13 = (<signed long long>1)
    v14 = method11(v13)
    v15 = (<signed long long>0)
    v16 = method11(v15)
    v17 = UH0_1()
    v18 = UH0_0(v8, v17)
    del v8; del v17
    v19 = UH0_0(v10, v18)
    del v10; del v18
    v20 = UH0_0(v12, v19)
    del v12; del v19
    v21 = UH0_0(v14, v20)
    del v14; del v20
    v22 = UH0_0(v16, v21)
    del v16; del v21
    v23 = method14(v22)
    del v22
    print(v23)
    del v23
    v24 = (<signed long long>0)
    method17(v24)
    v25 = (<signed long long>1)
    method17(v25)
    v26 = (<signed long long>5)
    method17(v26)
    v27 = (<signed long long>123)
    method17(v27)
    v28 = (<signed long long>654)
    method17(v28)
    v29 = (<signed long long>2)
    v30 = (<signed long long>29)
    v31 = method21(v29, v30)
    print(v31)
    del v31
    v32 = (<signed long long>2)
    v33 = (<signed long long>29)
    method24(v32, v33)
    v34 = (<signed long long>100)
    v35 = (<signed long long>0)
    v36 = (<signed long long>0)
    v37 = (<signed long long>1)
    v38 = (<signed long long>0)
    v39 = method28(v34, v35, v36, v37, v38)
    print(v39)
    del v39
    v40 = (<signed long long>100)
    v41 = (<signed long long>0)
    v42 = (<signed long long>0)
    v43 = (<signed long long>1)
    v44 = (<signed long long>0)
    method31(v40, v41, v42, v43, v44)
    v45 = numpy.empty(5,dtype=object)
    v45[0] = Tuple0((<signed long long>2), (<signed long long>0)); v45[1] = Tuple0((<signed long long>3), (<signed long long>0)); v45[2] = Tuple0((<signed long long>1), (<signed long long>5)); v45[3] = Tuple0((<signed long long>2), (<signed long long>2)); v45[4] = Tuple0((<signed long long>0), (<signed long long>11))
    v46 = (<signed long long>100)
    v47 = (<signed long long>0)
    v48 = (<signed long long>0)
    v49 = (<signed long long>1)
    v50 = (<signed long long>0)
    v51 = method35(v46, v47, v48, v49, v50, v45)
    del v45
    print(v51)
    del v51
    v52 = numpy.empty(5,dtype=object)
    v52[0] = Tuple0((<signed long long>2), (<signed long long>0)); v52[1] = Tuple0((<signed long long>3), (<signed long long>0)); v52[2] = Tuple0((<signed long long>1), (<signed long long>5)); v52[3] = Tuple0((<signed long long>2), (<signed long long>2)); v52[4] = Tuple0((<signed long long>0), (<signed long long>11))
    v53 = (<signed long long>100)
    v54 = (<signed long long>0)
    v55 = (<signed long long>0)
    v56 = (<signed long long>1)
    v57 = (<signed long long>0)
    method37(v53, v54, v55, v56, v57, v52)
    del v52
    v58 = 0
    v59 = 2
    v60 = 2
    v61 = 0
    v62 = numpy.empty(4,dtype=numpy.int32)
    v62[0] = v58; v62[1] = v59; v62[2] = v60; v62[3] = v61
    v63 = 0
    v64 = numpy.empty(1,dtype=numpy.int32)
    v64[0] = v63
    v65 = numpy.empty(2,dtype=object)
    v65[0] = Tuple3((<signed long long>0), v62); v65[1] = Tuple3((<signed long long>2), v64)
    del v62; del v64
    v66 = method41(v65)
    print(v66)
    del v66
    method42(v65)
    del v65
    v67 = 0
    v68 = US1_0(v67)
    v69 = method48(v68)
    del v68
    v70 = (<signed long long>2)
    v71 = US1_1(v70)
    v72 = method48(v71)
    del v71
    v73 = 0
    v74 = US1_0(v73)
    v75 = method48(v74)
    del v74
    v76 = 2
    v77 = US1_0(v76)
    v78 = method48(v77)
    del v77
    v79 = 2
    v80 = US1_0(v79)
    v81 = method48(v80)
    del v80
    v82 = 0
    v83 = US1_0(v82)
    v84 = method48(v83)
    del v83
    v85 = (<signed long long>0)
    v86 = US1_1(v85)
    v87 = method48(v86)
    del v86
    v88 = UH0_1()
    v89 = UH0_0(v69, v88)
    del v69; del v88
    v90 = UH0_0(v72, v89)
    del v72; del v89
    v91 = UH0_0(v75, v90)
    del v75; del v90
    v92 = UH0_0(v78, v91)
    del v78; del v91
    v93 = UH0_0(v81, v92)
    del v81; del v92
    v94 = UH0_0(v84, v93)
    del v84; del v93
    v95 = UH0_0(v87, v94)
    del v87; del v94
    v96 = method14(v95)
    del v95
    print(v96)
    del v96
    v97 = (<signed long long>0)
    v98 = US1_1(v97)
    method49(v98)
    del v98
    v99 = 0
    v100 = US1_0(v99)
    method49(v100)
    del v100
    v101 = 2
    v102 = US1_0(v101)
    method49(v102)
    del v102
    v103 = 2
    v104 = US1_0(v103)
    method49(v104)
    del v104
    v105 = 0
    v106 = US1_0(v105)
    method49(v106)
    del v106
    v107 = (<signed long long>2)
    v108 = US1_1(v107)
    method49(v108)
    del v108
    v109 = 0
    v110 = US1_0(v109)
    method49(v110)
    del v110
    v111 = (<signed long long>10)
    v112 = method51(v111)
    v113 = (<signed long long>5)
    v114 = method51(v113)
    v115 = (<signed long long>2)
    v116 = method51(v115)
    v117 = UH0_1()
    v118 = UH0_0(v112, v117)
    del v112; del v117
    v119 = UH0_0(v114, v118)
    del v114; del v118
    v120 = UH0_0(v116, v119)
    del v116; del v119
    v121 = method14(v120)
    del v120
    print(v121)
    del v121
    v122 = (<signed long long>2)
    method52(v122)
    v123 = (<signed long long>5)
    method52(v123)
    v124 = (<signed long long>10)
    method52(v124)
    v125 = (<signed long long>1)
    v126 = (<signed long long>3)
    v127 = method54(v125, v126)
    print(v127)
    del v127
    v128 = (<signed long long>1)
    v129 = (<signed long long>3)
    method55(v128, v129)
