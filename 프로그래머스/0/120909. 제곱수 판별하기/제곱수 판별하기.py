def solution(n):
    answer = 0
    for i in range(1, 1001):
        if i*i == n:
            answer = 1
            break
        elif i*i > n:
            answer = 2
            break
    return answer