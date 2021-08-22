# Intro To Serialization

Welcome to the first article of this series on creating a poker agent. Since trying to grasp the complete system all at once would be very difficult, the overall plan is to do the pieces in isolation, and then merge them together after they are done. Since the eventual goal will be to run and train these agents on the GPU, it would be best to first create a small library for the sake of converting arbitrary game data to the kinds of floating point tensors that neural nets can digest. While it is possible to hack something out on a case by case basis, isolated pieces such as these are much easier to test and serve as a proof of understanding.

This segment is going to come in two parts. I will create a Python version of such a library, and then a Spiral one and benchmark them against each other.

# Python

## Dense/Array

The goal here will be to create a library of Pickler/Unpickler combinators from which to glue together the serialization schema for arbitrary games. In Python, they will derive from the base PU class. It will serve as an abstract interface with 2 methods.

```py
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
```

The abstract interface above is what all the pickler combinators will follow and is mostly there for documentation purposes. We need a primitive combinator for integers, for tuples, for union types. And since union types might have cases with no fields, it is easiest to start with those.

```py
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
```

During serialization, the unit combinator just sets the the array to 1 at the given index.

The next will be a PU combinator for representing integers.

```py
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
```

During serialization, the int combinator sets the array to 1 at the given index plus the element. Deserialization is a bit harder as it needs to find the index of that 1 by iterating over all the elements. Since we need to account for the union types, it could also be that case that all the elements are zero. Lastly we need to account for the possibility of the array having trash data and assert that all elements are either 0 or 1.

This combinator has interesting functionality. Here are two helper functions to help use them.

```py
def serialize(schema : PU,x):
    ar = [0] * schema.size
    schema.pickle(x,0,ar)
    return ar

def deserialize(schema : PU,ar):
    x,c = schema.unpickle(0,ar)
    if c != 1: raise Exception("Invalid format.")
    return x
```

Here is a little example to illustrate what these PUs do.

```py
serialize(Int(5),1)
```
```
[0, 1, 0, 0, 0]
```

Here is another.

```py
serialize(Int(5),4)
```
```
[0, 0, 0, 0, 1]
```

The Unit combinator only ever returns a singleton array with a positive element.

```py
serialize(Unit(),())
```
```
[1]
```

An easy way to make sure that the serializers work is to serialize and deserialize them.

```py
def test_pu(schema : PU,x):
    x2 = deserialize(schema,serialize(schema,x))
    if x != x2: raise Exception("PU test failed.")
```

```py
test_pu(Int(5),3)
test_pu(Int(5),1)
test_pu(Unit(),())
```

No exception gets raised. Serializing integers to the one hot format is the simplest kind of serialization, but it is very useful. I use it for hand ranks and suits for example. It could be used for stack size if they are sufficiently small, but for those it would be better to have a proper binary serializer. Here it is.

```py
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
```

This one is similar to the Int serializer, except it uses the binary rather than the one-hot format and so is exponentially more efficient in the size of the input element.

Here are is an example of it in use.

```py
[serialize(BinInt(10),i) for i in [0,1,5,123,654]]
```
```
[[0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
 [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
 [0, 0, 0, 0, 0, 0, 0, 1, 1, 0],
 [0, 0, 0, 1, 1, 1, 1, 1, 0, 0],
 [1, 0, 1, 0, 0, 0, 1, 1, 1, 1]]
```

Testing `[test_pu(BinInt(10),i) for i in [0,1,5,123,654]]` also works fine. The next combinator is where things get interesting.

```py
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
```

What this does is allows PU combinators to be composed as tuples. As all datatypes can be mapped to either tuples or unions once we have those two, we will have unfetted freedom of serialization.

Its use is fairly simple.

```py
serialize(Tuple(Int(5),BinInt(5),Unit()),(2,29,()))
```
```
[0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1]
```

Here is a more motivated example.

```py
suit = Int(4)
rank = Int(13)
card = Tuple(suit,rank)
stack = BinInt(7)
print(serialize(Tuple(stack,card,card),(100,(0,0),(1,0))))
```
```
[1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
```

Naturally, tuple combinators can be composed with other tuple combinators as shown in the above example. That is what makes them powerful.

Before moving on to unions, one combinator worth covering is the array combinator. In poker, different betting streets have a different number of cards on the table and it would be inefficient to use unions to cover those eventualities.

