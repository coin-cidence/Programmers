def solution(progresses, speeds):
    from collections import deque
    queue = deque()
    answer = []
    count = 0
    
    for idx, i in enumerate(progresses):
        time = (100-i)//speeds[idx]
        if (100-i)%speeds[idx]  == 0:
            queue.append(time)
        else:
            queue.append(time + 1)
            
    while queue:
        standard = queue.popleft()
        count += 1
        
        while queue and standard>=queue[0]:
            queue.popleft()
            count += 1
        answer.append(count)
        count = 0
    return answer 