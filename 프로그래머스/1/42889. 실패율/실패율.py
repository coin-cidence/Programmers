def solution(N, stages):
    answer = []
    answer2=[]
    ans=[]
    user = len(stages)
    
    for num in range(1,N+1,1):
        answer.append(stages.count(num))
        
    for idx,i in enumerate(answer):
        if idx!=0: 
            user = user-(answer[idx-1])
        if user != 0:
            answer2.append(i/user)
        else: answer2.append(0)
        
    ans=[i+1 for i,v in sorted(enumerate(answer2), key=lambda x:x[1],reverse=True)]
    return  ans
