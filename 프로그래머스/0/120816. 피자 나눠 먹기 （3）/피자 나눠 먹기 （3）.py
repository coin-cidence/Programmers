def solution(slice, n):
    for i in range(1,100):
        if slice*i >= n:
            return i