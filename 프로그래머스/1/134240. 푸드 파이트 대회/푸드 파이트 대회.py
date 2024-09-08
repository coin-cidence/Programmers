def solution(food):
    answer = ''
    answer2 = ''
    food_n=[]
    for i in food:
        food_n.append(i//2)
    for idx, i in enumerate(food_n):
        if idx !=0:
            for j in range(i):
                answer += str(idx)
    answer += '0'
    for i in range(-2,-1*len(answer)-1,-1):
        answer2 += str(answer[i])
    
    return answer+answer2