from functools import reduce
import numpy as np
import math
import time
import collections

def sieve(n):
    flags = np.ones(n, dtype=bool)
    flags[0] = flags[1] = flags[4::2] = False
    for i in range(3, int(math.sqrt(n)+1), 2):
        if flags[i]:
            flags[i*i::i] = False
    flags[1487] = flags[4817] = flags[8147] = False
    return flags

def conCat(num, numX2):
        concated1 = math.floor(math.log10(numX2))
        return int(num*10**(1+concated1)+numX2)

def perms(i, j):
    x = map(int, str(i))
    y = map(int, str(i + j)) 
    z = map(int, str(i + 2*j)) 
    return collections.Counter(x) == collections.Counter(y) == collections.Counter(z)
    
def findAns():
    sieved = sieve(9999)
    for i in range(1009, 9973):
        if sieved[i]:
            for j in range(2, int(5000-0.5*i)):
                if sieved[i + j] and sieved[i + 2*j]:
                    if perms(i, j):
                        return reduce(conCat, [i, i + j, i + 2*j])
