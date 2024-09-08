def solution(numbers):
    answer = []
    for idx,i in enumerate(numbers):
        for j in range(idx+1,len(numbers)):
            if i+numbers[j] not in answer:
                answer.append(i+numbers[j])
    answer = sorted(answer)
    return answer