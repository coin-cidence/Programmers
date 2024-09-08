def solution(d, budget):
    answer = 0
    result = len(d)
    d = sorted(d)
    
    for idx, i in enumerate(d):
        if (answer + i <= budget):
            answer += i
        else:
            result = idx
            break
            
    return result