-- 코드를 입력하세요
SELECT *
FROM(
    SELECT F.FLAVOR
      FROM FIRST_HALF F ,JULY J
     WHERE F.FLAVOR=J.FLAVOR
     GROUP BY F.FLAVOR, J.FLAVOR
     ORDER BY (SUM(F.TOTAL_ORDER)+SUM(J.TOTAL_ORDER)) DESC)
WHERE ROWNUM <=3