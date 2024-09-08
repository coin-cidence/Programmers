def solution(strings, n):
    answer = []
    ans=[]
    strings = sorted(strings)
    
    for i in strings:
        answer.append(i[n])
    answer = sorted(answer)
    
    for i in answer:
        for s in strings:
            if i == s[n]:
                ans.append(s)
                strings.remove(s)
                break
    return ans