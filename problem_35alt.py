import numpy as np
import itertools
import time
limit= 10**6

def sieve(nums):
    for x in range(0, int((limit**0.5)/2)):
        nums[(nums!=nums[x]) & (nums % nums[x] == 0)] = 0
        nums = nums[nums!=0]
    return nums

def permify(nums):
    answer = []
    rotation = nums
    while not rotation in answer:
        answer.append(rotation)
        rotation = int(str(rotation)[1:] + str(rotation)[0])
    return answer

def num_circ(primes):
    count = []
    circ = True
    for num in primes:
        perms = permify(num)
        for y in perms:
            if y not in primes:
                circ = False
            primes = primes[primes!=y]
        if circ:
            count += perms
        circ = True
    return count

def problem_35():
    start = time.time()
    nums = np.arange(3, limit, 2, dtype=int)
    primes = sieve(nums)
    res = num_circ(primes)
    print(res, len(res)+1)
    print(time.time()-start)
    
problem_35()
