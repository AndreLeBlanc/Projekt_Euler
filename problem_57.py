import time
import math
numExpansions = 1000;

def hasMoreDigits(numerator, denominator):
    if numerator >= 1:
        if denominator < 1:
            return 1
        else:
            return hasMoreDigits(numerator//10, denominator//10)
    return 0

def problem_57():
    rec_start = time.time()
    numerator, denominator, prevNumerator, rec_tot = 1, 1, 1, 0

    for _ in range(0, numExpansions):
        prevNumerator = numerator
        numerator += 2*denominator
        denominator += prevNumerator
        rec_tot += hasMoreDigits(numerator, denominator)
    rec_stop = time.time()
    print("recursive solution: ", rec_tot, " took ", rec_stop-rec_start)

    math_start = time.time()
    numerator, denominator, prevNumerator, math_tot = 1, 1, 1, 0

    for _ in range(0, numExpansions):
        prevNumerator = numerator
        numerator += 2*denominator
        denominator += prevNumerator
        math_tot += math.ceil(math.log10(numerator + 1)) > math.ceil(math.log10(denominator + 1))
    math_stop = time.time()

    print("math solution: ", math_tot, " took ", math_stop-math_start)

