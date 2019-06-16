import time

def isPrime(num):
    for x in range(3, int(num**0.5)+1, 2):
        if num % x == 0:
            return False
    return True

def problem_58():
    start = time.process_time()
    primes = 3
    hopp = 4
    tot = 5
    num = 9

    while tot <= primes *10:
        new = [num + hopp, num + 2*hopp, num + 3*hopp, num + 4*hopp]
        num += (4*hopp)
        tot += 4
        hopp += 2
        primes += len(list(filter(isPrime, new)))
    end = time.process_time()
    print("The answer is:", hopp-1, "and it took", end-start, "seconds")
