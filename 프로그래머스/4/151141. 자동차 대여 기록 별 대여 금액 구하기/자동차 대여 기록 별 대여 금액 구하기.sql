WITH PLAN AS (
    SELECT lag(TO_NUMBER(REPLACE(DURATION_TYPE,'일 이상','')),1,0) over(order by PLAN_ID) AS DUR, lag(DISCOUNT_RATE,1,0) over(order by PLAN_ID) AS DISCOUNT_RATE
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE CAR_TYPE = '트럭'
    
    union
    
    SELECT TO_NUMBER(REPLACE(DURATION_TYPE,'일 이상','')) AS DUR, DISCOUNT_RATE
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE CAR_TYPE = '트럭'

)


SELECT HISTORY_ID, ROUND(daily_fee*(1-discount_rate*0.01)*SPAN) AS FEE
FROM PLAN, (
    SELECT HISTORY_ID, C.CAR_ID, CAR_TYPE, DAILY_FEE,(end_date-start_date)+1 AS SPAN
    FROM CAR_RENTAL_COMPANY_CAR C, CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    WHERE C.CAR_ID = H.CAR_ID
    AND C.CAR_TYPE = '트럭') U
WHERE U.SPAN >= PLAN.DUR
  AND PLAN.DUR = (
    SELECT MAX(DUR)
    FROM PLAN
    WHERE U.SPAN >= DUR
)
AND U.CAR_TYPE='트럭'
ORDER BY FEE DESC, HISTORY_ID DESC