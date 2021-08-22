from typing import Literal, Tuple

class PU:
    def pickle(self,x,i : int,ar) -> None: 
        """
        Serialized the object 'x' by setting the relevant fields of 'ar' to 1.
        
        x - Composite object to be serialized.

        i - Starting position of array 'ar'.

        ar - An array. Can be a Python list, or Numpy or a PyTorch 1d vector.
        """
        raise NotImplementedError()
    def unpickle(self,i : int,ar) -> Tuple[object,Literal[1, 0]]:
        """
        Deserializes the object from the array 'ar'. Returns the deserialized part
        of the object for that particular unpickler and 1/0 whether the unpickling has succeeded.

        x - Composite object to be serialized.

        i - Starting position of array 'ar'.
        """
        raise NotImplementedError()

class Unit(PU):
    def __init__(self) -> None:
        super().__init__()
        self.size = 1
    def pickle(self,x : Tuple[()],i,ar): 
        assert x == (), "The input to this should be a tuple."
        ar[i] = 1
    def unpickle(self,i,ar):
        x = ar[i]
        assert x == 0 or x == 1, "Unpickling failure. The unit type should always be either be active or inactive."
        return (), int(x)

class Int(PU):
    def __init__(self,size : int) -> None:
        super().__init__()
        self.size = size

    def pickle(self,x : int,i,ar):
        assert 0 <= x < self.size, f'Pickling failure. Int value out of bounds. Got: {x} Size: {self.size}'
        ar[i + x] = 1
    def unpickle(self,i_start,ar):
        case,c = 0,0
        for i in range(i_start,i_start+self.size):
            x = ar[i]
            assert x == 0 or x == 1, "Unpickling failure. The int type must either be active or inactive."
            if x == 1: case,c = i,c+1
        assert c == 0 or c == 1, "Unpickling failure. Too many active indices in the one-hot vector."
        return case-i_start,c

class BinInt(PU):
    """
    Unlike int which stores the value as a one-hot vector, this one stores it as a binary value.
    The value 0 is stored as 1, 1 as 2 and so on. During unpickling the zero vector is considered inactive.
    The max value is taken up by that inactive vactor. Hence the actual capacity is
    `2 ** size - 1` rather than `2 ** size`.
    """
    def __init__(self,size : int) -> None:
        super().__init__()
        assert 1 <= size <= 64, "The field size has to be in the [1,64] range."
        q = 1 << (size - 1)
        self.max_x = q + (q - 1)
        self.size = size

    def pickle(self,x : int,i_start,ar):
        assert 0 <= x < self.max_x, f'Pickle failure. Bin int value out of bounds. Got: {x} Size: {self.max_x}'
        x += 1
        for i in range(self.size):
            q = 1 << (self.size - i - 1)
            ar[i_start + i] = x // q
            x %= q
    def unpickle(self,i_start,ar):
        r = 0
        for i in range(self.size):
            x = ar[i_start+i]
            assert x == 0 or x == 1, "Unpickling failure. The bin int type must either be active or inactive."
            r += int(x) << (self.size - i - 1)
        return r-1, (1 if 0 < r else 0)

class Tuple(PU):
    def __init__(self,*pus) -> None:
        super().__init__()
        self.size = 0
        for x in pus: self.size += x.size
        self.pus = pus

    def pickle(self,xs,i_start,ar):
         i = i_start
         for x,pu in zip(xs,self.pus): 
            pu.pickle(x,i,ar)
            i += pu.size
    def unpickle(self,i_start,ar):
        i,c,l = i_start,0,[]
        for pu in self.pus: x,c2 = pu.unpickle(i,ar); i += pu.size; c += c2; l.append(x)
        assert c == 0 or c == len(self.pus), "Unpickling failure. The tuple should have all of its elements be either active or inactive."
        return tuple(l), c // len(self.pus)

def serialize(schema : PU,x):
    ar = [0] * schema.size
    schema.pickle(x,0,ar)
    return ar

def deserialize(schema : PU,ar):
    x,c = schema.unpickle(0,ar)
    if c != 1: raise Exception("Invalid format.")
    return x

def test_pu(schema : PU,x):
    x2 = deserialize(schema,serialize(schema,x))
    if x != x2: raise Exception("PU test failed.")

# [test_pu(BinInt(10),i) for i in [0,1,5,123,654]]
# test_serializer(BinInt(20),0)
# test_serializer(BinInt(20),8)
# test_serializer(BinInt(20),123)
suit = Int(4)
rank = Int(13)
card = Tuple(suit,rank)
stack = BinInt(7)
print(serialize(Tuple(stack,card,card),(100,(0,0),(1,0))))