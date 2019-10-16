import time

def followsPattern(sqr):
        for i in range(9, 0, -1):
            if sqr % 10 == i:
                sqr = sqr//100
            else:
                return False
        return True

def problem_206():
    start = time.time()
    for i in range(138902663, 101010101, -1):
        if followsPattern(i*i):
            break
    print("Answer: ", i, " took: ", time.time()-start)
