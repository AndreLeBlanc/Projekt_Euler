import collections
import numpy as np
import math 

def sieve(n):
    flags = np.ones(n, dtype=bool)
    flags[0] = flags[1] = flags[4::2] = False
    for i in range(3, int(math.sqrt(n)+1), 2):
        if flags[i]:
            flags[i*i::i] = False
    return np.flatnonzero(flags)
    
def isPan(concatinated):
    allDigits = [1,2,3,4,5,6,7]
    digitList = map(int, str(concatinated))
    return collections.Counter(allDigits) == collections.Counter(digitList)

def main():
    for x in reversed(sieve(7654321)):
        if isPan(x):
            return x

if __name__ == "__main__":
    main()
