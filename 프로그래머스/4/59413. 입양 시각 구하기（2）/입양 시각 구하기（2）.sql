WITH hours AS (
    SELECT LEVEL - 1 AS hour_value
    FROM dual
    CONNECT BY LEVEL <= 24
)

SELECT h.hour_value,
       NVL(t.count, 0) AS hour_value
FROM hours h,
(
    SELECT TO_NUMBER(TO_CHAR(DATETIME, 'HH24')) AS hour,
           COUNT(ANIMAL_ID) AS COUNT
    FROM ANIMAL_OUTS
    group by TO_NUMBER(TO_CHAR(DATETIME, 'HH24'))
) t
where h.hour_value = t.hour(+)
ORDER BY h.hour_value;