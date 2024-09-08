def solution(a, b, n):
    answer = 0
    rest = 0
    
    while 1:
        if n%a == 0:
            n = (n/a)*b
            answer += n
            
        else:
            rest += n%a
            n = (n//a)*b
            answer += n
            
            
        if a>n:
            n += rest
            rest = 0
            if a>n:
                break
    return answer