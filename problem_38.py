import math
import collections
import time

def conCat(num, numX2):
    concated = math.floor(math.log10(numX2))
    return int(num*10**(1+concated)+numX2)

def isPan(concatinated):
    allDigits = [1,2,3,4,5,6,7,8,9]
    digitList = map(int, str(concatinated))
    return collections.Counter(allDigits) == collections.Counter(digitList)

def findAns():
    for num in range(9387, 9000, -1):
        concatinated = conCat(num, 2*num)
        if isPan(concatinated):
            return concatinated

def main():
    startTime = time.process_time()
    ans = findAns()
    endTime = time.process_time()
    print("The answer is:", ans, "and it took", endTime - startTime, "seconds")
    
if __name__ == "__main__":
    main()
